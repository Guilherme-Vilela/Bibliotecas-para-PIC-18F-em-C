#line 1 "C:/Users/guilh/Documents/CEDUP/Eletronica/PIC/LIB_dht11/MyProject.c"


sbit LCD_RS at RC6_bit;
sbit LCD_EN at RC7_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISC6_bit;
sbit LCD_EN_Direction at TRISC7_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 24 "C:/Users/guilh/Documents/CEDUP/Eletronica/PIC/LIB_dht11/MyProject.c"
uint8_t leituraByteDht11(){
 uint8_t i = 8, dht11_byte = 0;




 while(i--){
 while(! RD3_bit  );
 delay_us(40);

 if(  RD3_bit  ){
 dht11_byte |= (1 << i);
 while(  RD3_bit  );
 }
 }
 return(dht11_byte);
}

void leitura_dht11(uint8_t *dht11_humi, uint8_t *dht11_temp)
{
 char temp[] = "Temp = 00.0 C";
 char humi[] = "Umid = 00.0 %";

  TRISD3_bit  = 0;
  RD3_bit  = 0;
 delay_ms(25);
  RD3_bit  = 1;
 delay_us(30);
  TRISD3_bit  = 1;


 while(  RD3_bit  );
 while( ! RD3_bit  );
 while(  RD3_bit  );


 *dht11_humi = leituraByteDht11();
 leituraByteDht11();
 *dht11_temp = leituraByteDht11();
 leituraByteDht11();
 leituraByteDht11();

 temp[7] = *dht11_temp / 10 + '0';
 temp[8] = *dht11_temp % 10 + '0';
 humi[7] = *dht11_humi / 10 + '0';
 humi[8] = *dht11_humi % 10 + '0';
 temp[11] = 223;
 lcd_out(1, 1, temp);
 lcd_out(2, 1, humi);

}


void main()
{
 delay_ms(1000);
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 while(1)
 {
 char umidade, temperatura;

 leitura_dht11(&umidade, &temperatura);

 delay_ms(1000);
 }

}
