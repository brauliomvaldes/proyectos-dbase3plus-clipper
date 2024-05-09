**********************
********* PRINFAC.PRG
**********************
                                SET DEVICE TO PRINTER
                                SET PRINTER ON
                                SET CONSOLE OFF
                                SETPRC()
                                ***  ESPACIO = 1 LINEAS JUNTAS
                                ***  ESPACIO = 2 LINEAS SEPARADAS
                                ESPACIO=1
                                @10,14 SAY XDIA
                                @10,21 SAY MESES[VAL(XMES)]
                                @10,34 SAY XANNO
                                @12,14 SAY XNOMBRE
                                @12,64 SAY XRUTCLI
                                @14,14 SAY XDIRECCION
                                @14,64 SAY XCOMUNA
                                @16,17 SAY XOCOMPRA
                                @16,38 SAY XGIRO
                                @16,64 SAY XFONO
                                @18,23 SAY XGD
                                @18,64 SAY XCV           

                                FOR FF=1 TO MAXFILA - 1
                                        FFIL=(FF*ESPACIO+23)
                                        @FFIL,4 SAY COLCANTFACT[FF] PICT "9999999"
                                        @FFIL,13 SAY COLDETAFACT[FF]
                                        @FFIL,61 SAY COLPRECFACT[FF] PICT "99999.99"
                                        @FFIL,69 SAY COLTOTAFACT[FF] PICT "99,999,999"
                                NEXT
                                @51,11 SAY XSON1
                                @51,69 SAY XNETO PICT "99,999,999"
                                @52,11 SAY XSON2                  
                                @53,62 SAY "19"
                                @53,69 SAY XIVA PICT "99,999,999"
                                @55,69 SAY XTOTALFAC PICT "99,999,999" 
                                ? " "
                                EJECT
                                SET DEVICE TO SCREEN
                                SET PRINTER OFF
                                SET CONSOLE ON                     
                                RETURN
