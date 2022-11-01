#include <stdlib.h>

void leak() {
  void *stuff = malloc(1000000);
}

typedef struct {
  int value;
} my_t;

void double_free() {
  my_t *st = malloc(sizeof(my_t));
  st->value = 1;
  free(st);
  // free(st);
}

void use_after_free() {
  my_t *st = malloc(sizeof(my_t));
  st->value = -1;
  free(st);
  // st->value = 2;
}
