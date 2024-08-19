			ORG 0000H
				
Phase1: 		MOV TMOD,#01H 
						MOV TL0,#0DCH	
						MOV TH0,#0FFH	
						
						MOV TCON,#10H		; start timer
						CLR P1.0			; Here it sets it to low for the duration set in the timer
				
Wait:				JNB TCON.5,Wait		; Continue until 50us pass
						SETB P1.0			; Sets P1.0 high for 9 clock cycles (tick)
						MOV TCON,#00H		; Stop Timer
						SJMP Phase1			; Infinite Loop Produces a Square Wave of f=20kHz
END