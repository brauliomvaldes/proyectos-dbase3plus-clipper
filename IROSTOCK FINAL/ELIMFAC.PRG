**************************
************** ELIMFAC.PRG
**************
DECLARE COLCANTFACT[13]
DECLARE COLDETAFACT[13]
DECLARE COLPRECFACT[13]
DECLARE COLTOTAFACT[13]
SET ESCAPE ON
                SET COLOR TO GR+/R
                CLEAR
                DO FORMFACX
                SET COLOR TO R/GR+
                @00,00 SAY IRO0
                @01,04 SAY IRO1

                 SET COLOR TO B+/W
                 SELE 2
                 GO BOTTOM
                 NUM_FAC=RECNO()
                 @00,22 SAY " E L I M I N A "
                 @00,49 SAY NUM_FAC PICT "9999999"

                        SET COLOR TO G+/B,B/W+
                        XRUT=RUT
                        XFECHA=FECHA
                        XNETO=NETO
                        XIVA=IVA
                        XTOTAL=TOTAL
                        XOCOMPRA=OCOMPRA
                        XGD=GD
                        XCV=CV

                        XXFECHA=DTOC(XFECHA)

                        XDIA=SUBSTR(XXFECHA,1,2)
                        XFECHA=XDIA+" de"
                        XANNO=SUBSTR(XXFECHA,7,2)
                        IF VAL(XANNO)>7
                                XANNO="19"+XANNO
                        ELSE
                                XANNO="20"+XANNO
                        ENDIF
                        XMES=SUBSTR(XXFECHA,4,2)
                        IF VAL(XMES)>0 .AND. VAL(XMES)<13
                                XFECHA=XFECHA+MESES[VAL(XMES)]+"de "+XANNO
                        ENDIF
                        

                SELE 1
                LOCA ALL FOR CODIGO=XRUT
                IF .NOT. EOF()
                        FOR P=1 TO 13
                                COLCANTFACT[P]=0
                                COLDETAFACT[P]=""
                                COLPRECFACT[P]=0
                                COLTOTAFACT[P]=0
                        NEXT

                        

                        @03,65 SAY RUT  
                        @03,14 SAY NOMBRE 
                        @04,14 SAY DIRECCION
                        @04,65 SAY COMUNA
                        @05,37 SAY GIRO 
                        @05,65 SAY FONO
                        @05,16 SAY XOCOMPRA
                        @06,25 SAY XGD
                        @06,65 SAY XCV 

                        @02,14 SAY XFECHA
                        XRUTCLI=RUT
                        XNOMBRE=NOMBRE
                        XDIRECCION=DIRECCION
                        XCOMUNA=COMUNA
                        XGIRO=GIRO
                        XFONO=FONO
                        FF=7
                        P=0
                        SELE 4
                        LOCA ALL FOR N_FACTURA=NUM_FAC
                        DO WHILE .NOT. EOF()
                                FF=FF+1
                                @FF,03 SAY CANTIDAD PICT "9999999"
                                @FF,14 SAY ARTICULO
                                @FF,54 SAY PRECIO PICT "99999.99"
                                @FF,68 SAY TOTAL PICT "999,999,999"
                                P=P+1
                                COLCANTFACT[P]=CANTIDAD
                                COLDETAFACT[P]=ARTICULO
                                COLPRECFACT[P]=PRECIO
                                COLTOTAFACT[P]=TOTAL
                                LINDETALLE=P
                                CONTINUE
                        ENDDO

                        @22,68 SAY XNETO PICT "999,999,999"
                        @23,68 SAY XIVA PICT "999,999,999"
                        @24,68 SAY XTOTAL PICT "999,999,999"
                        XTOTALFAC=XTOTAL
                ELSE
                        DO TECLA WITH "ERROR!, EL CLIENTE NO EXISTE"
                        RETURN               
                ENDIF
                DO TECLA WITH "PARA ELIMINAR FACTURA PRESIONE (E)"
                IF LASTKEY()=69
                *******.AND. NUM_FAC=ULT_FAC
                        SELE 2
                        DELETE ALL FOR N_FACTURA=NUM_FAC
                        PACK
                        COMMIT
                        SELE 4
                        DELETE ALL FOR N_FACTURA=NUM_FAC
                        PACK
                        COMMIT
                ENDIF
SET ESCAPE OFF
RETURN
