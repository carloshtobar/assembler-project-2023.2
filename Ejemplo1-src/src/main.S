; Simple AVR assembly program

#include <avr/io.h>

.text       ; program segment

.global main
main:
      ; Set-up ports
      cbi   _SFR_IO_ADDR(DDRD),   PD7
      sbi   _SFR_IO_ADDR(PORTD),  PD7
      sbi   _SFR_IO_ADDR(DDRB),   PB5

loop:
      sbis  _SFR_IO_ADDR(PIND),   PD7
      rjmp  is_zero
      sbi   _SFR_IO_ADDR(PORTB),  PB5     ; it is not zero
      rjmp  continue
is_zero:
      cbi   _SFR_IO_ADDR(PORTB),  PB5
continue:
      rjmp loop


