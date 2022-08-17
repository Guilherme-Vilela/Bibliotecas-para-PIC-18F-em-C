#line 1 "C:/Users/guilh/Documents/CEDUP/Eletronica/PIC/PWM/MyProject.c"
unsigned short dutyCicle1, dutyCicle2;
#line 1 "c:/users/guilh/documents/cedup/eletronica/pic/pwm/pwm.h"
void aceleraPWM1(short valor){
 dutyCicle1 += valor;
 PWM1_Set_Duty(dutyCicle1);
}
void aceleraPWM2(short valor){
 dutyCicle2 += valor;
 PWM2_Set_Duty(dutyCicle2);
}
void desaceleraPWM1(short valor){
 dutyCicle1 += valor;
 PWM1_Set_Duty(dutyCicle1);
}
void desaceleraPWM2(short valor){
 dutyCicle2 += valor;
 PWM2_Set_Duty(dutyCicle2);
}

void iniciarPWM() {
 PWM1_Init(2000);
 PWM2_Init(2000);
 PWM1_Start();
 PWM2_Start();
 dutyCicle1 = 0;
 dutyCicle2 = 0;
 PWM1_Set_Duty(dutyCicle1);
 PWM2_Set_Duty(dutyCicle2);

 while(dutyCicle1 < 150){
 aceleraPWM1(1);
 }

 while(dutyCicle2 < 150){
 aceleraPWM2(1);
 }
}
#line 3 "C:/Users/guilh/Documents/CEDUP/Eletronica/PIC/PWM/MyProject.c"
void main() {
 iniciarPWM();
 while (1) {

 Delay_ms(5);

}
}
