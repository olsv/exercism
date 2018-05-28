#include "anagram.h"
#include <stdio.h>

struct Vector anagrams_for(char * source, struct Vector options) {
  printf("%s, %s\n", source, options.vec[0]);
  return options;
}
