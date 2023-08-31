#define F_CPU 1000000UL // 1MHz
#include <util/delay.h> // Biblioteca para retardos
#include <avr/io.h>     // Definición de registros de I/O

int main() {

        DDRB = 0xFF;  // PuertoB como salida
        PORTB = 0x00; // Valor inicial en PuertoB
        while(1) {    // Ciclo infinito
                PINB = 0x01; // Conmuta PB0
                _delay_ms(500);  // Retardo de 500ms
        }


}