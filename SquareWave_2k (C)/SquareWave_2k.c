/*8051 library*/
#include <reg51.h>

/*macros*/
#define TRUE 1
/*defining delay time*/
#define DELAY_L 0X17	/*added 12H to compensate instruction time*/
#define DELAY_H 0XFF

/*define delay function*/
void T0_delay(void);

/*define output pin*/
sbit sqWave = P2^0;

void main(void)
{
	sqWave = 0;
	while(TRUE)
	{
		sqWave = 1;
		T0_delay();
		sqWave = 0;
		T0_delay();
	}
}

void T0_delay(void)
{
	/*Configure mode 1 for T0*/
	TMOD = 0X01;
	
	/*Setting delay values in TL0 and TH0*/
	TL0 = DELAY_L;
	TH0 = DELAY_H;
	
	/*Start timer 0*/
	TR0 = 1;
	
	/*Loop until timer stops*/
	while(TF0 == 0);
	
	/*Stops timer*/
	TR0 = 0;
	TF0 = 0;
}

