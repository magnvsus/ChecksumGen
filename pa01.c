#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(int argc, char *argv[])
{
    // Check if valid number of arguments is given.
    if (argc != 3) {
        fprintf(stderr, "Invalid args:\n\tpa01.c <filename> <checksum>\n", argv[0]);
        return 1;
    }

    FILE *file;
    char* filename = malloc(strlen(argv[1])*sizeof(char) + 1);
    int checksumSize = atoi(argv[2]);

    // Open file from argv 1    
    file = fopen(argv[1], "r");
    if (file == NULL) {
        fprintf(stderr, "Invalid file name.");
        return 1;
    }

    fclose(file);
    return 0;
}
