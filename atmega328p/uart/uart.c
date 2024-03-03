#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 16000000
#define BAUDRATE 115200

const unsigned int TIMER_CNT_05MS = 31250;

unsigned char g_recv_str;

ISR(TIMER1_COMPA_vect){
  PORTB ^= (1<<PB1);

  while ( !(UCSR0A & (1 << RXC0)) ){
        /* Do Nothing */
  }
  /* Get and return received data from buffer */
  g_recv_str = UDR0;

  while ( !(UCSR0A & (1 << UDRE0))){
        /* Do Nothing */
  }
  /* Put data into buffer, sends the data */
  UDR0 = g_recv_str;
}

int main(void){
  UBRR0 =  (unsigned int)(((float)F_CPU / BAUDRATE / 16.0) - 1.0 + 0.5);
  UCSR0B = (1 << RXEN0) | (1 << TXEN0);
  UCSR0C = (0 << USBS0) | (3 << UCSZ00);

  TCCR1A=0;
  TCCR1B=0;
  TCCR1B |= (1<<WGM12) | (1<<CS12); // CTCmode, Prescaler 256
  OCR1A= TIMER_CNT_05MS;
  TIMSK1 |= (1<<OCIE1A) | (1<<OCIE1B);

  DDRB |= (1<<PB1) | (1<<PB2);

  sei();
  while(1){}
  cli();
  return 0;
}