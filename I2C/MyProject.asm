
_interrupt:

;MyProject.c,51 :: 		void interrupt()
;MyProject.c,56 :: 		}//end interrupt
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,57 :: 		void main()
;MyProject.c,59 :: 		ADCON1     = 0x0F;                        //Apenas entradas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;MyProject.c,61 :: 		Lcd_Init();                               //Inicia módulo LCD
	CALL        _Lcd_Init+0, 0
;MyProject.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);                      //Limpa display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,63 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                 //Apaga cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,64 :: 		Lcd_Out(1,2,"PIC18F4550 I2C");            //imprime no display
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,66 :: 		I2C1_Init(400000);                        //Inicializa comunicação I2C
	MOVLW       12
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;MyProject.c,67 :: 		I2C1_Start();                             //Inicia I2C
	CALL        _I2C1_Start+0, 0
;MyProject.c,68 :: 		I2C1_Wr(0xA0);                            //Envia o byte por I2C (endereço do dispositivo + Write)
	MOVLW       160
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MyProject.c,69 :: 		I2C1_Wr(0x05);                            //Envia o valor da posição de memória a ser escrita
	MOVLW       5
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MyProject.c,70 :: 		I2C1_Wr(39);                              //Escreve o dado 39 na memória
	MOVLW       39
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MyProject.c,71 :: 		I2C1_Stop();                              //Para I2C
	CALL        _I2C1_Stop+0, 0
;MyProject.c,73 :: 		delay_ms(100);                            //aguarda 100ms
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;MyProject.c,75 :: 		I2C1_Start();                             //Inicia I2C
	CALL        _I2C1_Start+0, 0
;MyProject.c,76 :: 		I2C1_Wr(0xA0);                            //Envia o byte por I2C (endereço do dispositivo)
	MOVLW       160
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MyProject.c,77 :: 		I2C1_Wr(0x05);                            //Envia o valor da posição de memória
	MOVLW       5
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MyProject.c,78 :: 		I2C1_Repeated_Start();                    //Restart I2C
	CALL        _I2C1_Repeated_Start+0, 0
;MyProject.c,79 :: 		I2C1_Wr(0xA1);                            //Envia byte endereço do dispositivo + Read
	MOVLW       161
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MyProject.c,80 :: 		store1 = I2C1_Rd(0u);                     //Lê o dado e armazena em store1
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       _store1+0 
;MyProject.c,81 :: 		I2C1_Stop();                              //Para o I2C
	CALL        _I2C1_Stop+0, 0
;MyProject.c,83 :: 		IntToStr(store1, txt1);                   //converte a variável para string
	MOVF        _store1+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt1+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;MyProject.c,85 :: 		Lcd_Out(2,2,txt1);                        //imprime no LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,88 :: 		while(1)                                  //Loop infinito
L_main1:
;MyProject.c,91 :: 		} // end while
	GOTO        L_main1
;MyProject.c,93 :: 		} // end main
L_end_main:
	GOTO        $+0
; end of _main
