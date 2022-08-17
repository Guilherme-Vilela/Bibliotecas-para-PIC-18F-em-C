
//============================================================================
// --- Liga��es entre PIC e LCD ---
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


//=============================================================================
// --- Mapeamento de Hardware ---


//=============================================================================
// --- Prot�tipo das Fun��es ---


//=============================================================================
// --- Vari�veis Globais ---
unsigned short store1 = 0x00;
char txt1[7];


//=============================================================================
// --- Interrup��es ---
void interrupt()
{



}//end interrupt
void main()
{
     ADCON1     = 0x0F;                        //Apenas entradas digitais

     Lcd_Init();                               //Inicia m�dulo LCD
     Lcd_Cmd(_LCD_CLEAR);                      //Limpa display
     Lcd_Cmd(_LCD_CURSOR_OFF);                 //Apaga cursor
     Lcd_Out(1,2,"PIC18F4550 I2C");            //imprime no display

     I2C1_Init(400000);                        //Inicializa comunica��o I2C
     I2C1_Start();                             //Inicia I2C
     I2C1_Wr(0xA0);                            //Envia o byte por I2C (endere�o do dispositivo + Write)
     I2C1_Wr(0x05);                            //Envia o valor da posi��o de mem�ria a ser escrita
     I2C1_Wr(39);                              //Escreve o dado 39 na mem�ria
     I2C1_Stop();                              //Para I2C

     delay_ms(100);                            //aguarda 100ms

     I2C1_Start();                             //Inicia I2C
     I2C1_Wr(0xA0);                            //Envia o byte por I2C (endere�o do dispositivo)
     I2C1_Wr(0x05);                            //Envia o valor da posi��o de mem�ria
     I2C1_Repeated_Start();                    //Restart I2C
     I2C1_Wr(0xA1);                            //Envia byte endere�o do dispositivo + Read
     store1 = I2C1_Rd(0u);                     //L� o dado e armazena em store1
     I2C1_Stop();                              //Para o I2C

     IntToStr(store1, txt1);                   //converte a vari�vel para string

     Lcd_Out(2,2,txt1);                        //imprime no LCD


     while(1)                                  //Loop infinito
     {

     } // end while

} // end main


//=============================================================================
// --- Desenvolvimento das Fun��es Auxiliares ---


//=============================================================================