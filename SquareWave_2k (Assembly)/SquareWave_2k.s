ORG 0000H
CLR P2.0		
Repeat: MOV TMOD,#01H ;Timer 0 Mode 1 (16-bit)
				MOV TL0,#14H	;Count = 250 ticks = 0xFA, tick = 1us, halfPeriod=0.25ms
				MOV TH0,#0FFH	;Up Counter -> FFFF - FA = FF05H + FH to compensate the time of instructions
				MOV TCON,#10H	;Start Timer
Wait:	JNB TCON.5,Wait	;Continue if 0.25 ms didn't pass
			CPL P2.0	;Square Wave (if zero flip to one and so on)
			MOV TCON,#00H	;Stop Timer
			SJMP Repeat	;Infinite Loop Produces a Square Wave of f=2kHz
END