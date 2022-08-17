
_leituraByteDht11:

;MyProject.c,24 :: 		uint8_t leituraByteDht11(){
;MyProject.c,25 :: 		uint8_t i = 8, dht11_byte = 0;
	MOVLW       8
	MOVWF       leituraByteDht11_i_L0+0 
	CLRF        leituraByteDht11_dht11_byte_L0+0 
;MyProject.c,30 :: 		while(i--){
L_leituraByteDht110:
	MOVF        leituraByteDht11_i_L0+0, 0 
	MOVWF       R0 
	DECF        leituraByteDht11_i_L0+0, 1 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_leituraByteDht111
;MyProject.c,31 :: 		while(!DHT11_PIN );
L_leituraByteDht112:
	BTFSC       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_leituraByteDht113
	GOTO        L_leituraByteDht112
L_leituraByteDht113:
;MyProject.c,32 :: 		delay_us(40);
	MOVLW       26
	MOVWF       R13, 0
L_leituraByteDht114:
	DECFSZ      R13, 1, 1
	BRA         L_leituraByteDht114
	NOP
;MyProject.c,34 :: 		if( DHT11_PIN ){
	BTFSS       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_leituraByteDht115
;MyProject.c,35 :: 		dht11_byte |= (1 << i);  // << desloca bits para esquerda
	MOVF        leituraByteDht11_i_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__leituraByteDht1121:
	BZ          L__leituraByteDht1122
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__leituraByteDht1121
L__leituraByteDht1122:
	MOVF        R0, 0 
	IORWF       leituraByteDht11_dht11_byte_L0+0, 1 
;MyProject.c,36 :: 		while( DHT11_PIN );
L_leituraByteDht116:
	BTFSS       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_leituraByteDht117
	GOTO        L_leituraByteDht116
L_leituraByteDht117:
;MyProject.c,37 :: 		}
L_leituraByteDht115:
;MyProject.c,38 :: 		}
	GOTO        L_leituraByteDht110
L_leituraByteDht111:
;MyProject.c,39 :: 		return(dht11_byte);
	MOVF        leituraByteDht11_dht11_byte_L0+0, 0 
	MOVWF       R0 
;MyProject.c,40 :: 		}
L_end_leituraByteDht11:
	RETURN      0
; end of _leituraByteDht11

_leitura_dht11:

;MyProject.c,42 :: 		void leitura_dht11(uint8_t *dht11_humi, uint8_t *dht11_temp)
;MyProject.c,44 :: 		char temp[] = "Temp = 00.0 C";
	MOVLW       ?ICSleitura_dht11_temp_L0+0
	MOVWF       TBLPTRL+0 
	MOVLW       hi_addr(?ICSleitura_dht11_temp_L0+0)
	MOVWF       TBLPTRL+1 
	MOVLW       higher_addr(?ICSleitura_dht11_temp_L0+0)
	MOVWF       TBLPTRL+2 
	MOVLW       leitura_dht11_temp_L0+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(leitura_dht11_temp_L0+0)
	MOVWF       FSR1L+1 
	MOVLW       28
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
;MyProject.c,47 :: 		DHT11_PIN_DIR = 0;   // CONFIGURA SAIDA
	BCF         TRISD3_bit+0, BitPos(TRISD3_bit+0) 
;MyProject.c,48 :: 		DHT11_PIN     = 0;   // LINHA DE DADOS PARA LOW
	BCF         RD3_bit+0, BitPos(RD3_bit+0) 
;MyProject.c,49 :: 		delay_ms(25);        // DELAY 25 ms
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_leitura_dht118:
	DECFSZ      R13, 1, 1
	BRA         L_leitura_dht118
	DECFSZ      R12, 1, 1
	BRA         L_leitura_dht118
	NOP
;MyProject.c,50 :: 		DHT11_PIN     = 1;   // SOLTA A LINHA DE DADOS
	BSF         RD3_bit+0, BitPos(RD3_bit+0) 
;MyProject.c,51 :: 		delay_us(30);        // DELAY 30 us
	MOVLW       19
	MOVWF       R13, 0
L_leitura_dht119:
	DECFSZ      R13, 1, 1
	BRA         L_leitura_dht119
	NOP
	NOP
;MyProject.c,52 :: 		DHT11_PIN_DIR = 1;   // CONFIGURA COMO ENTRADA
	BSF         TRISD3_bit+0, BitPos(TRISD3_bit+0) 
;MyProject.c,55 :: 		while( DHT11_PIN );  //AGUARDA INCIALIZAÇÃO DO DHT
L_leitura_dht1110:
	BTFSS       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_leitura_dht1111
	GOTO        L_leitura_dht1110
L_leitura_dht1111:
;MyProject.c,56 :: 		while( !DHT11_PIN );
L_leitura_dht1112:
	BTFSC       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_leitura_dht1113
	GOTO        L_leitura_dht1112
L_leitura_dht1113:
;MyProject.c,57 :: 		while( DHT11_PIN );
L_leitura_dht1114:
	BTFSS       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_leitura_dht1115
	GOTO        L_leitura_dht1114
L_leitura_dht1115:
;MyProject.c,60 :: 		*dht11_humi = leituraByteDht11();  // LEITURA DO PRIMEIRO BYTE DE UMIDADE 1
	CALL        _leituraByteDht11+0, 0
	MOVFF       FARG_leitura_dht11_dht11_humi+0, FSR1L+0
	MOVFF       FARG_leitura_dht11_dht11_humi+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,61 :: 		leituraByteDht11();               // LEITURA DO SEGUNDO BYTE TEMPERATURA
	CALL        _leituraByteDht11+0, 0
;MyProject.c,62 :: 		*dht11_temp = leituraByteDht11();  // LEITURA DO PRIMEIRO BYTE DE TEMPERATURA 1
	CALL        _leituraByteDht11+0, 0
	MOVFF       FARG_leitura_dht11_dht11_temp+0, FSR1L+0
	MOVFF       FARG_leitura_dht11_dht11_temp+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,63 :: 		leituraByteDht11();               // LEITURA DO SEGUNDO BYTE TEMPERATURA
	CALL        _leituraByteDht11+0, 0
;MyProject.c,64 :: 		leituraByteDht11();               // LEITURA DO DADO DE VERIFIÇÃO
	CALL        _leituraByteDht11+0, 0
;MyProject.c,66 :: 		temp[7]  = *dht11_temp / 10  + '0';
	MOVFF       FARG_leitura_dht11_dht11_temp+0, FSR0L+0
	MOVFF       FARG_leitura_dht11_dht11_temp+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       10
	MOVWF       R4 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       leitura_dht11_temp_L0+7 
;MyProject.c,67 :: 		temp[8]  = *dht11_temp % 10  + '0';
	MOVFF       FARG_leitura_dht11_dht11_temp+0, FSR0L+0
	MOVFF       FARG_leitura_dht11_dht11_temp+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       10
	MOVWF       R4 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       leitura_dht11_temp_L0+8 
;MyProject.c,68 :: 		humi[7]  = *dht11_humi / 10  + '0';
	MOVFF       FARG_leitura_dht11_dht11_humi+0, FSR0L+0
	MOVFF       FARG_leitura_dht11_dht11_humi+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       10
	MOVWF       R4 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       leitura_dht11_humi_L0+7 
;MyProject.c,69 :: 		humi[8]  = *dht11_humi % 10  + '0';
	MOVFF       FARG_leitura_dht11_dht11_humi+0, FSR0L+0
	MOVFF       FARG_leitura_dht11_dht11_humi+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       10
	MOVWF       R4 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       leitura_dht11_humi_L0+8 
;MyProject.c,70 :: 		temp[11] = 223;    //Simbolo °
	MOVLW       223
	MOVWF       leitura_dht11_temp_L0+11 
;MyProject.c,71 :: 		lcd_out(1, 1, temp);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       leitura_dht11_temp_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(leitura_dht11_temp_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,72 :: 		lcd_out(2, 1, humi);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       leitura_dht11_humi_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(leitura_dht11_humi_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,74 :: 		}
L_end_leitura_dht11:
	RETURN      0
; end of _leitura_dht11

_main:

;MyProject.c,77 :: 		void main()
;MyProject.c,79 :: 		delay_ms(1000);           // wait a second
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	DECFSZ      R11, 1, 1
	BRA         L_main16
	NOP
	NOP
;MyProject.c,80 :: 		Lcd_Init();               // initialize LCD module
	CALL        _Lcd_Init+0, 0
;MyProject.c,81 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,82 :: 		Lcd_Cmd(_LCD_CLEAR);      // clear LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,84 :: 		while(1)
L_main17:
;MyProject.c,88 :: 		leitura_dht11(&umidade, &temperatura);
	MOVLW       main_umidade_L1+0
	MOVWF       FARG_leitura_dht11_dht11_humi+0 
	MOVLW       hi_addr(main_umidade_L1+0)
	MOVWF       FARG_leitura_dht11_dht11_humi+1 
	MOVLW       main_temperatura_L1+0
	MOVWF       FARG_leitura_dht11_dht11_temp+0 
	MOVLW       hi_addr(main_temperatura_L1+0)
	MOVWF       FARG_leitura_dht11_dht11_temp+1 
	CALL        _leitura_dht11+0, 0
;MyProject.c,90 :: 		delay_ms(1000);  // wait a second
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
	NOP
;MyProject.c,91 :: 		}
	GOTO        L_main17
;MyProject.c,93 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
