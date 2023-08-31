#define __SFR_OFFSET 0
#include <avr/io.h>

.section .text
.global main

main:
        ldi   R16, 0xFF
        out   DDRB, R16     ; El puertoB se configura como salida
        clr   R16
        out   PORTB, R16    ; Valor inicial para el puertoB (0X00)

loop:
        sbi   PINB, 0       ; Conmuta PB0
        rcall delay_500ms
        rjmp  loop
;
; Rutina de espera de 500ms
; 2*(250*(250*4 us))
;
delay_500ms:
        push  R18
        push  R17
        push  R16
        ldi   R18, 2
  et3:  ldi   R17, 250
  et2:  ldi   R16, 250
  et1:  nop                 ; Itera 250 veces, 4us por iteración
        dec   R16           ; 250*4us = 1ms
        brne  et1           ; Evalúa la bandera de cero
                            ; brinca si R16 no ha llegado a cero
        dec   R17
        brne  et2           ; 1ms*250 = 250ms
        
        dec   R18
        brne  et3           ; 250ms*2 = 500ms
        pop   R16
        pop   R17
        pop   R18
        ret


