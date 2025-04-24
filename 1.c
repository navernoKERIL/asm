#include <stdio.h>

int test(int x, int y);

int main() 
{
  int x = 0, y = 0;
  scanf("%d%d", &x, &y);
 
  printf("%d\n", test(x, y));
  return 0;
}

int test(int x, int y)
{
  int val = x;
  if (x < -3){
    if (x > y){
      val = x * y;
    }
    else{
      val = x + y;
    }
  }
  else {if (x <= 2){
         val = x ^ y;
       }
       else{
         val = x - y;
       }
  }
  return val; 
}


