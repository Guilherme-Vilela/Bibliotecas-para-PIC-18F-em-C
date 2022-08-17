#line 1 "C:/Users/guilh/Documents/CEDUP/Eletronica/PIC/I2C/MyProject.c"
#line 20 "C:/Users/guilh/Documents/CEDUP/Eletronica/PIC/I2C/MyProject.c"
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
#line 45 "C:/Users/guilh/Documents/CEDUP/Eletronica/PIC/I2C/MyProject.c"
unsigned short store1 = 0x00;
char txt1[7];




void interrupt()
{



}
void main()
{
 ADCON1 = 0x0F;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,2,"PIC18F4550 I2C");

 I2C1_Init(400000);
 I2C1_Start();
 I2C1_Wr(0xA0);
 I2C1_Wr(0x05);
 I2C1_Wr(39);
 I2C1_Stop();

 delay_ms(100);

 I2C1_Start();
 I2C1_Wr(0xA0);
 I2C1_Wr(0x05);
 I2C1_Repeated_Start();
 I2C1_Wr(0xA1);
 store1 = I2C1_Rd(0u);
 I2C1_Stop();

 IntToStr(store1, txt1);

 Lcd_Out(2,2,txt1);


 while(1)
 {

 }

}
