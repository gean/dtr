provider primes {
   probe primecalc__start(long prime);            /* Start prime calculation */
   probe primecalc__done(long prime, int isprime); /* End prime calculation */
   probe primecalc__tablesize(long tablesize);     /* Exposes table size of */
};                                                 /* existing primes.      */
