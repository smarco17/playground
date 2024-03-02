#define F_CPU 1000000UL

#include <avr/io.h>
#include <util/delay.h>

int main(){
    DDRB |= (1 << PB1);

    while(1){
        PORTB ^= (1 << PB1);
        _delay_ms(500);
    }
}