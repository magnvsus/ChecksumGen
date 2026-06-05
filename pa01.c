// Compile with gcc -lm pa01.c -o pa01
// Run with ./pa01 <filename> <checksum>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(int argc, char *argv[])
{
    //-- Check if valid number of arguments is given.
    if (argc != 3) {
        fprintf(stderr, "Invalid args:\n\tpa01.c <filename> <checksum>\n", argv[0]);
        return 1;
    }

    //-- Throw error for invalid checksum
    int checksumSize = atoi(argv[2]);
    if(checksumSize != 8 && checksumSize != 16 && checksumSize != 32){
        fprintf(stderr, "Valid checksum sizes are 8, 16, or 32\n"); 
        return 1;
    }

    //-- Open file from argv 1   
    FILE *file;
 
    file = fopen(argv[1], "r");
    if (file == NULL) {
        fprintf(stderr, "Invalid file name.");
        return 1;
    }

    //-- Get size of file
    // Send cursor to end, then ftell
    fseek(file, 0, SEEK_END);
    unsigned int fileSize = (unsigned int)ftell(file);
    //printf("fS:%u\n", fileSize);
    // Return cursor to start
    fseek(file, 0, SEEK_SET);
    

    //-- Calculate padding requirement
    // Calculate num of characters loaded into checksum word.
    unsigned int charCount = checksumSize/8;
    //printf("cC:%u\n", charCount);
    // Calculate padding. 
    unsigned int remainder = fileSize % charCount;
    unsigned int paddingCount = (remainder) ? charCount - remainder : 0;
    //printf("pC:%u\n", paddingCount);


    //-- Move chars into checksum, then store in list
    unsigned int checksumListSize = (unsigned int)(ceil((double)fileSize/charCount));
    //printf("lS:%d\n", checksumListSize);
    unsigned int* checksumList[checksumListSize];
    unsigned int* checksum;
    unsigned char curr;
    int loopCount, inCount = fileSize, printCount = 0;
    // Loop for each word
    for(int i = 0; i < checksumListSize; i++) {
        checksum = malloc(sizeof(unsigned int));
        *checksum = 0;
        // Loop for each char
        for(loopCount = charCount; loopCount > 0; loopCount--)
        {
            // If there's still chars left to parse, push them into checksum 
            if(inCount > 0) {
                /* 1.Convert to unsigned.
                *  2.Bitwise shift depending on checksum size.
                *  3.Bitwise OR with checksum
                *  Example:
                *  checksum                            next char     result       
                *  0b00000000000000000000000000000000  01011000 ---> 0b01011000000000000000000000000000
                *  0b01011000000000000000000000000000  01011001 ---> 0b01011000010110010000000000000000   */
                curr = (unsigned char)fgetc(file);
                if(!(printCount%80)) printf("\n");
                if(curr == '\n') printf("\\n");
                printf("%c", curr);
                printCount++;
                *checksum = *checksum | (curr << (loopCount-1)*8);
                inCount--;
                //printf("-%.*b\n", checksumSize, *checksum);
            }
            // After using all chars, push padding into checksum
            else {
                *checksum = *checksum | (unsigned char)'X' << (loopCount-1) * 8;
                //printf("-%.*b\n", checksumSize, *checksum);
            }
        }
        checksumList[i] = checksum;
    }
    //printf("\n");

    
    //-- Bitwise add words, ignore overflow
    unsigned int current = *checksumList[0];
    //printf("%d-%.*b\n",0, checksumSize, current);
    for(int i = 1; i < checksumListSize; i++)
    {
        current += *checksumList[i];
        // If less than 32bit, handle overflow.
        if(checksumSize==8) current = current & 255;
        else if(checksumSize==16) current = current & 65535;
        // Otherwise, unsigned int ignores 32bit overflow
        //printf("%d-%.*b\n",i, checksumSize, current);
    }
    

    //-- Find Two's complement. 
    //current = ~current + 1;
    //if(checksumSize==8) current = current & 255;
    //else if(checksumSize==16) current = current & 65535;
    //printf("2\'s-%.*b\n", checksumSize, current);
    printf("%2d bit checksum is %x for all %d chars\n", checksumSize, current, fileSize);

    //-- Interpret value then append to end.

    fclose(file);
    return 0;
}
