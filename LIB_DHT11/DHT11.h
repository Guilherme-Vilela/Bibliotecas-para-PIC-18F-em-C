                          //biblioteca para DHT11
#include <stdint.h> //BIBLIOTECA PARA TRABALHAR com unit8_t

// read one byte from sensor
uint8_t leituraByteDht11(){
  uint8_t i = 8, dht11_byte = 0;
  //O padrao do DHT11 É 50us entre bits
  //BIT 1 é linha  de dados em vcc por 70us
  //BIT 0 é a linha de dados em GND por 25us
  // 50us baixo 70us ou 25us alto depois 50us baixo ...
  while(i--){
    while(!DHT11_PIN );
    delay_us(40);

    if( DHT11_PIN ){
      dht11_byte |= (1 << i);  // << desloca bits para esquerda
      while( DHT11_PIN );
    }
  }
  return(dht11_byte);
}

void leitura_dht11(uint8_t *dht11_humi, uint8_t *dht11_temp)
{
  char temp[] = "Temp = 00.0 C";
  char humi[] = "Umid = 00.0 %";
  // INICIANDO COMUNICAÇÃO
  DHT11_PIN_DIR = 0;   // CONFIGURA SAIDA
  DHT11_PIN     = 0;   // LINHA DE DADOS PARA LOW
  delay_ms(25);        // DELAY 25 ms
  DHT11_PIN     = 1;   // SOLTA A LINHA DE DADOS
  delay_us(30);        // DELAY 30 us
  DHT11_PIN_DIR = 1;   // CONFIGURA COMO ENTRADA

  // Inicialização do DHT
  while( DHT11_PIN );  //AGUARDA INCIALIZAÇÃO DO DHT
  while( !DHT11_PIN );
  while( DHT11_PIN );

  // Leitura das infomrações
  *dht11_humi = leituraByteDht11();  // LEITURA DO PRIMEIRO BYTE DE UMIDADE 1
  leituraByteDht11();               // LEITURA DO SEGUNDO BYTE TEMPERATURA
  *dht11_temp = leituraByteDht11();  // LEITURA DO PRIMEIRO BYTE DE TEMPERATURA 1
  leituraByteDht11();               // LEITURA DO SEGUNDO BYTE TEMPERATURA
  leituraByteDht11();               // LEITURA DO DADO DE VERIFIÇÃO

    temp[7]  = *dht11_temp / 10  + '0';
    temp[8]  = *dht11_temp % 10  + '0';
    humi[7]  = *dht11_humi / 10  + '0';
    humi[8]  = *dht11_humi % 10  + '0';
    temp[11] = 223;    //Simbolo °
    lcd_out(1, 1, temp);
    lcd_out(2, 1, humi);

}