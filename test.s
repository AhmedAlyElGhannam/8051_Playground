ORG 0000H

LB EQU 33H
HB EQU 0FFH

TEST: MOV A,#0FFH
			MOV 40H,A
			MOV 41H,A

			MOV A,#0H
			MOV 42H,A
			MOV 43H,A

HIGHER: MOV A,41H ;higher
				ADDC A,43H
				MOV 45H,A

				CJNE A,#HB,CLEAR ;jump to clear if not equal

LOWER: MOV A,40H ;lower
			 ADD A,42H
			 MOV 44H,A
			 
			 CLR C
			 SUBB A,#LB
			 JC CLEAR
			 JNC HERE

CLEAR: CLR A
			 MOV 44H,A
			 MOV 45H,A

HERE: JMP HERE
END
	
	
	
	