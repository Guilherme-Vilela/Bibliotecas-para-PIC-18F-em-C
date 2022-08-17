
_aceleraPWM1:

;pwm.h,1 :: 		void aceleraPWM1(short valor){
;pwm.h,2 :: 		dutyCicle1 += valor;
	MOVF        FARG_aceleraPWM1_valor+0, 0 
	ADDWF       _dutyCicle1+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _dutyCicle1+0 
;pwm.h,3 :: 		PWM1_Set_Duty(dutyCicle1);        // Atualiza Duty cicle PWM1
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pwm.h,4 :: 		}
L_end_aceleraPWM1:
	RETURN      0
; end of _aceleraPWM1

_aceleraPWM2:

;pwm.h,5 :: 		void aceleraPWM2(short valor){
;pwm.h,6 :: 		dutyCicle2 += valor;
	MOVF        FARG_aceleraPWM2_valor+0, 0 
	ADDWF       _dutyCicle2+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _dutyCicle2+0 
;pwm.h,7 :: 		PWM2_Set_Duty(dutyCicle2);        // Atualiza Duty cicle PWM2
	MOVF        R0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pwm.h,8 :: 		}
L_end_aceleraPWM2:
	RETURN      0
; end of _aceleraPWM2

_desaceleraPWM1:

;pwm.h,9 :: 		void desaceleraPWM1(short valor){
;pwm.h,10 :: 		dutyCicle1 += valor;
	MOVF        FARG_desaceleraPWM1_valor+0, 0 
	ADDWF       _dutyCicle1+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _dutyCicle1+0 
;pwm.h,11 :: 		PWM1_Set_Duty(dutyCicle1);        // Atualiza Duty cicle PWM2
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pwm.h,12 :: 		}
L_end_desaceleraPWM1:
	RETURN      0
; end of _desaceleraPWM1

_desaceleraPWM2:

;pwm.h,13 :: 		void desaceleraPWM2(short valor){
;pwm.h,14 :: 		dutyCicle2 += valor;
	MOVF        FARG_desaceleraPWM2_valor+0, 0 
	ADDWF       _dutyCicle2+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _dutyCicle2+0 
;pwm.h,15 :: 		PWM2_Set_Duty(dutyCicle2);        // Atualiza Duty cicle PWM2
	MOVF        R0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pwm.h,16 :: 		}
L_end_desaceleraPWM2:
	RETURN      0
; end of _desaceleraPWM2

_iniciarPWM:

;pwm.h,18 :: 		void iniciarPWM() {
;pwm.h,19 :: 		PWM1_Init(2000);                    // Configura o PWM para 2Khz
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       156
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;pwm.h,20 :: 		PWM2_Init(2000);                    // Configura o PWM para 2Khz
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       156
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;pwm.h,21 :: 		PWM1_Start();                       // inicia PWM1   CCP1
	CALL        _PWM1_Start+0, 0
;pwm.h,22 :: 		PWM2_Start();                       // start PWM2    CCP1
	CALL        _PWM2_Start+0, 0
;pwm.h,23 :: 		dutyCicle1 = 0;                 // Duty cicle a ser utilizado 0 - 255
	CLRF        _dutyCicle1+0 
;pwm.h,24 :: 		dutyCicle2 = 0;                 // Duty cicle a ser utilizado 0 - 255
	CLRF        _dutyCicle2+0 
;pwm.h,25 :: 		PWM1_Set_Duty(dutyCicle1);        // Atualiza Duty cicle PWM1
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pwm.h,26 :: 		PWM2_Set_Duty(dutyCicle2);       // Atualiza Duty cicle PWM2
	MOVF        _dutyCicle2+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pwm.h,28 :: 		while(dutyCicle1 < 150){
L_iniciarPWM0:
	MOVLW       150
	SUBWF       _dutyCicle1+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_iniciarPWM1
;pwm.h,29 :: 		aceleraPWM1(1);
	MOVLW       1
	MOVWF       FARG_aceleraPWM1_valor+0 
	CALL        _aceleraPWM1+0, 0
;pwm.h,30 :: 		}
	GOTO        L_iniciarPWM0
L_iniciarPWM1:
;pwm.h,32 :: 		while(dutyCicle2 < 150){
L_iniciarPWM2:
	MOVLW       150
	SUBWF       _dutyCicle2+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_iniciarPWM3
;pwm.h,33 :: 		aceleraPWM2(1);
	MOVLW       1
	MOVWF       FARG_aceleraPWM2_valor+0 
	CALL        _aceleraPWM2+0, 0
;pwm.h,34 :: 		}
	GOTO        L_iniciarPWM2
L_iniciarPWM3:
;pwm.h,35 :: 		}
L_end_iniciarPWM:
	RETURN      0
; end of _iniciarPWM

_main:

;MyProject.c,3 :: 		void main() {
;MyProject.c,4 :: 		iniciarPWM();
	CALL        _iniciarPWM+0, 0
;MyProject.c,5 :: 		while (1) {                         // endless loop
L_main4:
;MyProject.c,7 :: 		Delay_ms(5);                      // slow down change pace a little  }}
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
;MyProject.c,9 :: 		}
	GOTO        L_main4
;MyProject.c,10 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
