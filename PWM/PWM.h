unsigned short dutyCicle1, dutyCicle2;
#include "PWM.h"
void aceleraPWM1(short valor){
    dutyCicle1 += valor;
    PWM1_Set_Duty(dutyCicle1);        // Atualiza Duty cicle PWM1
}
void aceleraPWM2(short valor){
    dutyCicle2 += valor;
    PWM2_Set_Duty(dutyCicle2);        // Atualiza Duty cicle PWM2
}
void desaceleraPWM1(short valor){
    dutyCicle1 += valor;
    PWM1_Set_Duty(dutyCicle1);        // Atualiza Duty cicle PWM2
}
void desaceleraPWM2(short valor){
    dutyCicle2 += valor;
    PWM2_Set_Duty(dutyCicle2);        // Atualiza Duty cicle PWM2
}

void iniciarPWM() {
  PWM1_Init(2000);                    // Configura o PWM para 2Khz
  PWM2_Init(2000);                    // Configura o PWM para 2Khz
  PWM1_Start();                       // inicia PWM1   CCP1
  PWM2_Start();                       // start PWM2    CCP1
  dutyCicle1 = 0;                 // Duty cicle a ser utilizado 0 - 255
  dutyCicle2 = 0;                 // Duty cicle a ser utilizado 0 - 255
  PWM1_Set_Duty(dutyCicle1);        // Atualiza Duty cicle PWM1
  PWM2_Set_Duty(dutyCicle2);       // Atualiza Duty cicle PWM2
  
  while(dutyCicle1 < 150){
    aceleraPWM1(1);
  }
  
  while(dutyCicle2 < 150){
    aceleraPWM2(1);
  }
}

