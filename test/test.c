#include<reg51.h>
sbit mybit = P1^0;

void T0M2Delay(unsigned char);

void main(void)
{
		while(1)
		{
				mybit = ~mybit;
				T0M2Delay(0);
				mybit = ~mybit;
				T0M2Delay(1);
		}
}

void T0M2Delay(unsigned char c)
{
		TMOD=0x02;
		if(c==0)
		{
				TH0=0x0B7;
		}
		else if(c==1)
		{
				TH0=0x0F2;
		}
		TR0=1;
		while(TF0==0);
		TR0=0;
		TF0=0;
}