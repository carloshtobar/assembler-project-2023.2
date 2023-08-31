#define __SFR_OFFSET 0
#include <avr/io.h>

.section .text
.global main

main:
      ; Set-up ports
      cbi   DDRD,   PD7
      sbi   PORTD,  PD7
      sbi   DDRB,   PB5

loop:
      sbis  PIND,   PD7
      rjmp  is_zero
      sbi   PORTB,  PB5     ; it is not zero
      rjmp  continue
is_zero:
      cbi   PORTB,  PB5
continue:
      rjmp loop
