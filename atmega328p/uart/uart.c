#include <avr/io.h>
#include <avr/interrupt.h>

#define F_OSC 16000000
#define BAUDRATE 9600

const unsigned int TIMER_CNT_05MS = 31250;
const unsigned int TIMER_CNT_01MS = 6250;

volatile unsigned int recv_cnt;
volatile unsigned char array_recv_char[100];

void put_char(unsigned char l_char);

int main(void){
  UBRR0 =  (unsigned int)(((float)F_OSC / BAUDRATE / 16.0) - 1.0 + 0.5);
  UCSR0B = (1 << RXCIE0) | (1 << RXEN0) | (1 << TXEN0);
  UCSR0C = (0 << USBS0) | (3 << UCSZ00);

  TCCR1A=0;
  TCCR1B=0;
  TCCR1B |= (1<<WGM12) | (1<<CS12); // CTCmode, Prescaler 256
  OCR1A= TIMER_CNT_05MS;
  TIMSK1 |= (1<<OCIE1A) | (1<<OCIE1B);

  DDRB |= (1<<PB1) | (1<<PB2);

  sei();
  while(1);
  cli();
  return 0;
}

ISR(TIMER1_COMPA_vect){
  PORTB ^= (1<<PB1);
}

ISR(USART_RX_vect){
  volatile unsigned char recv_char;
  recv_char = UDR0;

  array_recv_char[recv_cnt] = recv_char;
  recv_cnt++;

  put_char(recv_char);
  if(recv_char=='\r'){
    recv_cnt = 0;
    put_char('\r');
    put_char('\n');
    put_char('-');
    put_char('>');
  }
}

void put_char(unsigned char l_char){
  while ( !(UCSR0A & (1 << UDRE0)));
  UDR0 = l_char;
}