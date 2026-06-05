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

    FILE *file;
    char* filename = malloc(strlen(argv[1])*sizeof(char) + 1);
    int checksumSize = atoi(argv[2]);

    //-- Open file from argv 1    
    file = fopen(argv[1], "r");
    if (file == NULL) {
        fprintf(stderr, "Invalid file name.");
        return 1;
    }


    //-- Get size of file
    // Send cursor to end, then ftell
    fseek(file, 0, SEEK_END);
    unsigned int fileSize = (unsigned int)ftell(file) - 1;
    printf("fS:%u\n", fileSize);
    // Return cursor to start
    fseek(file, 0, SEEK_SET);
    

    //-- Calculate padding requirement
    // Calculate num of characters loaded into checksum word.
    unsigned int charCount = checksumSize/8;
    printf("cC:%u\n", charCount);
    // Calculate padding. 
    unsigned int remainder = fileSize % charCount;
    unsigned int paddingCount = (remainder) ? charCount - remainder : 0;
    printf("pC:%u\n", paddingCount);


    //-- Move chars into checksum, then store in list
    unsigned int checksumListSize = (unsigned int)(ceil((double)fileSize/charCount));
    printf("lS:%d\n", checksumListSize);
    unsigned int* checksumList[checksumListSize];
    unsigned int* checksum;
    int loopCount, inCount = fileSize;
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
                *checksum = *checksum | ((unsigned char)fgetc(file) << (loopCount-1)*8);
                inCount--;
                printf("%d-%.*b\n",loopCount, checksumSize, *checksum);
            }
            // After using all chars, push padding into checksum
            else {
                *checksum = *checksum | (unsigned char)'X' << (loopCount-1) * 8;
                printf("%d-%.*b\n",loopCount, checksumSize, *checksum);
            }
        }
        checksumList[i] = checksum;
    }

    fclose(file);
    return 0;
}
