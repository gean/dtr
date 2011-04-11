#include <stdio.h>
#include "probes.h"

      /*     Usage:    $0
       *   
       *   Recommendations:  
       *      -  Do not put probes at the start or end of function.
       *         FBT handles this case.
       *      -  Avoid placing a probe in the last statement of a function.
       *      -  Place probes in operationally useful locations.
       *      
       */  

long primes[1000000] = { 3 };
long primecount = 1;

int main(int argc, char **argv)
{
  long divisor = 0;
  long currentprime = 5;
  long isprime = 1;

  while (currentprime < 1000000)    /*  1000000  */
    {
      isprime = 1;
      PRIMES_PRIMECALC_START(currentprime);
      for(divisor=0;divisor<primecount;divisor++)
        {
          if (currentprime % primes[divisor] == 0)
            {
              isprime = 0;
            }
        }
      PRIMES_PRIMECALC_DONE(currentprime,isprime);
      if (isprime)
        {
          primes[primecount++] = currentprime;
          PRIMES_PRIMECALC_TABLESIZE(primecount);
          printf("%ld is a prime\n",currentprime);
        }
      currentprime = currentprime + 2;
    }
  return(0);
}
