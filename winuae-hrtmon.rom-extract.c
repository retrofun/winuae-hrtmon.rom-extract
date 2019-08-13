/*
 * winuae-hrtmon.rom-extract 1.0
 *
 * extracts hrtmon.rom from WinUAE's source file hrtmon.rom.cpp
 * https://github.com/tonioni/WinUAE/blob/master/hrtmon.rom.cpp
 */

#include <stdio.h>
#include <stdlib.h>

#define HRTMON_ROM_FILENAME "hrtmon.rom"

extern unsigned char hrtrom[];
extern unsigned int hrtrom_len;

int main(int argc, char *argv[] ) {
  FILE *file = NULL;
  unsigned int count = 0;

  file = fopen(HRTMON_ROM_FILENAME".gz", "r");
  if (file) {
    printf("Refusing to write %s as it already exists. Exiting...\n", HRTMON_ROM_FILENAME".gz");

    fclose(file);
    return EXIT_FAILURE;
  }

  file = fopen(HRTMON_ROM_FILENAME".gz", "wb");
  if (file) {
    for (count = 0; count < hrtrom_len; count++) {
      fwrite(&hrtrom[count], 1, 1, file);
    }
    fclose(file);
  }

  return EXIT_SUCCESS;
}
