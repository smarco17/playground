#include <avr/io.h>
#include <avr/interrupt.h>

const unsigned int TIMER_CNT_05MS = 31250;
const unsigned int TIMER_CNT_01MS = 6250;

ISR(TIMER1_COMPA_vect){
  PORTB ^= (1<<PB1);
}

ISR(TIMER1_COMPB_vect){
  PORTB ^= (1<<PB2);
}

int main(void){
  TCCR1A=0;
  TCCR1B=0;
  TCCR1B |= (1<<WGM12) | (1<<CS12); // CTCmode, Prescaler 256
  OCR1A= TIMER_CNT_01MS;
  OCR1B= TIMER_CNT_01MS;
  TIMSK1 |= (1<<OCIE1A) | (1<<OCIE1B);

  DDRB |= (1<<PB1) | (1<<PB2);

  sei();
  while(1){}
  cli();
  return 0;
}