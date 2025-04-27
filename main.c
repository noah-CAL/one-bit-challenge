#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

#define BIN_FILE "mystery"
#define SEED 0xDEADBEEF

uint32_t compute_hash(uint32_t);

int main() {
	char *c = malloc(1000);
	if (c == NULL) {
		printf("Congratulations, you successfully modified the file!\n" 
					 "Solution hash: %x\n", compute_hash(SEED));
		exit(0);
	} else {
		printf("Nothing to see here...\n");
		exit(-1);
	}
}

uint32_t compute_hash(uint32_t seed) {
	FILE *fp = fopen(BIN_FILE, "r");
	if (fp == NULL) {
		printf("Error opening file %s\n", BIN_FILE);
		exit(-1);
	}
	uint32_t hash = seed;
	uint32_t byte;
	while (fread((void *) &byte, 1, 1, fp) == 1) {
		hash ^= (seed * byte);
	}
	fclose(fp);
	return hash;
}

