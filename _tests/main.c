#include <stdlib.h>

void leak() {
  void *stuff = malloc(1000000);
}
