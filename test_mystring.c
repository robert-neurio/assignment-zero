#include "mystring.h"
#include <assert.h>
#include <sys/types.h>
#include <string.h>
#include <stdio.h>

/*
 * The following are simple tests to help you.
 * You should develop more extensive tests, otherewise
 * you may lose points when we grade your project.
*/
int main()
{
  char s1[100], *s2;

  assert (mystrlen("cmpt 300") == 8);
  
  mystrcpy (s1, "I am testing my string functions!");
  printf("Test: %s\n", s1);
  assert(strcmp(s1, "I am testing my string functions!") == 0);
  

  assert(mystrcmp ("I love coding", "I love coding") == 0);

  s2 = mystrdup(s1);
  assert (!strcmp(s1, s2));
  assert (s1 != s2);
  
  if (s2 != NULL) 
    free (s2);

  printf ("\nPassed VERY simple tests, remember to develop more tests.\n");
  
  return 0;
}

