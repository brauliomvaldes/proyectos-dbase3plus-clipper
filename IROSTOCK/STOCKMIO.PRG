*********
**** MODULO STOCK.PRG
****
SET MESSAGE TO 24 CENTER
SET TALK OFF
SET BELL OFF
SET CONFIRM OFF
SET DATE BRIT
SET SAFETY OFF
SET WRAP ON
SET ESCAPE OFF
DECLARE V_CAMPO[2]
V_CAMPO[2]="DETALLE"
V_CAMPO[1]="STOCK"

DECLARE V_CAMPO2[2]
V_CAMPO2[2]="DETALLE"
V_CAMPO2[1]="CANTIDAD"

DECLARE V_CAMPO3[3]
V_CAMPO3[3]="DETALLE"
V_CAMPO3[1]="CANTIDAD"
V_CAMPO3[2]="STOCK"



******** REVISA EXISTENCIA DE ARCHIVOS PRINCIPALES
IF .NOT. FILE ("CONTROL.DBF")
         CLEAR
         @10,10 SAY "ERROR !!!!  NO EXISTE EL ARCHIVO.CO"
         @12,10 SAY "LLAMAR A SOPORTE BRAULIO 6323745.6331216"
         WAIT             
         RETURN
ENDIF


IF .NOT. FILE ("CLIENTE.DBF")
         CLEAR
         @10,10 SAY "ERROR !!!!  NO EXISTE EL ARCHIVO.CL0"
         @12,10 SAY "LLAMAR A SOPORTE BRAULIO 6323745.6331216"
         WAIT             
         RETURN
ENDIF
IF .NOT. FILE ("ARTICULO.DBF")
         CLEAR
         @10,10 SAY "ERROR !!!! NO EXISTE EL ARCHIVO.AR0"
         @12,10 SAY "LLAMAR A SOPORTE BRAULIO 6323745.6331216"
         WAIT                      
         RETURN
ENDIF

*****************************
************ BUSCA AUTORIZACION
*******************

**** DE IVAN
**** CHEQUEO="El n£mero de serie del volumen es B028-D90A"
**** DE PRUEBA EN PENDRIVE NOTEBOOK BVA
**** CHEQUEO="Volume Serial Number is 453C-3907"
**** DE DISCO DURO D NOTEBOOK
**** CHEQUEO="Volume Serial Number is A409-9EC2"
**** DE DISCO DURO C NOTEBOOK
**** CHEQUEO="Volume Serial Number is 245D-39A1"

**** DE PENDRIVE DESDE OFICINA
CHEQUEO="El n£mero de serie del volumen es 453C-3907"


!DIR FACTIRO.EXE > DVXX.IA1
           
USE CONTROL
ZAP

APPEND FROM DVXX.IA1 SDF DELIMITED WITH !

GO TOP

AUTORIZA=.F.
DO WHILE .NOT. EOF()
        
        C_INFO=INFO        
        IF C_INFO=CHEQUEO
                AUTORIZA=.T.
                EXIT
        ENDIF
        SKIP
ENDDO


!DEL DVXX.IA1

ZAP
USE

IF !AUTORIZA
        CLEAR
        ?
        ?
        ?
        ?
        ? "USTED NO TIENE AUTORIZACION PARA"
        ?
        ? "UTILIZAR ESTE PROGRAMA"
        ?
        ? "PIDA LA AUTORIZACION"
        ?
        ? "CORRESPONDIENTE. GRACIAS"
        ?
        ? "FAVOR LLAME A BVA"
        WAIT 
        RETURN
ENDIF








SELE 1
USE PRODUCE
SELE 2
USE ARTICULO

        ************************
        DECLARE MESES[13]
        MESES[1]= "   Enero    "
        MESES[2]= "  Febrero   "
        MESES[3]= "   Marzo    "
        MESES[4]= "   Abril    "
        MESES[5]= "   Mayo     "
        MESES[6]= "   Junio    "
        MESES[7]= "   Julio    "
        MESES[8]= "  Agosto    "
        MESES[9]= " Septiembre "
        MESES[10]="  Octubre   "
        MESES[11]=" Noviembre  "
        MESES[12]=" Diciembre  "


        *******************************


OPC=5

A1=CHR(ASC("E"))+" "
A2=CHR(ASC("N"))+" "
A3=CHR(ASC("V"))+" "
A4=CHR(ASC("A"))+" "
A5=CHR(ASC("S"))+" "
A6=CHR(ASC("E"))+" "
A7=CHR(ASC("S"))+"  "
A8=CHR(ASC("I"))+" "
A9=CHR(ASC("R"))+" "
A10=CHR(ASC("O"))
A11=CHR(ASC("S"))
A12=CHR(ASC("a"))
A13=CHR(ASC("n"))+" "
A14=CHR(ASC("F"))
A15=CHR(ASC("r"))
A16=CHR(ASC("a"))
A17=CHR(ASC("n"))
A18=CHR(ASC("c"))
A19=CHR(ASC("i"))
A20=CHR(ASC("s"))
A21=CHR(ASC("c"))
A22=CHR(ASC("o"))+" "
A23=CHR(ASC("1"))
A24=CHR(ASC("5"))
A25=CHR(ASC("7"))
A26=CHR(ASC("5"))
A27=CHR(ASC("F"))
A28=CHR(ASC("o"))
A29=CHR(ASC("n"))
A30=CHR(ASC("o"))+" "
A31=CHR(ASC("5"))
A32=CHR(ASC("5"))
A33=CHR(ASC("5"))+" "
A34=CHR(ASC("6"))
A35=CHR(ASC("6"))
A36=CHR(ASC("9"))
A37=CHR(ASC("3"))
IRO0=A1+A2+A3+A4+A5+A6+A7
IRO1=A8+A9+A10
IRO2=A11+A12+A13+A14+A15+A16+A17+A18+A19+A20+A21+A22+A23+A24+A25+A26
IRO3=A27+A28+A29+A30+A31+A32+A33+A34+A35+A36+A37
AUTOR=CHR(ASC("B"))+CHR(ASC("V"))+CHR(ASC("A"))




DO WHILE .T.
        SET COLOR TO Y+/G,B/W+
        CLEAR
        DO FONDO
        @00,00 SAY IRO0+IRO1
        @01,00 SAY IRO2
        @02,00 SAY IRO3
        @24,00 SAY REPLICATE(" ",80)
        @00,77 SAY AUTOR
        SET COLOR TO R+/Y,B/W+

        @04,24 SAY    "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
        @05,24 SAY    "      EXISTENCIAS (STOCK)       ³"
        @06,24 SAY    "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
        @07,56 TO 17,56
        SET COLOR TO B+/B

        FOR FL=7 TO 17
                @FL,24 SAY REPLICATE ("þ",32)
        NEXT 

        SET COLOR TO W/B
        @08,28 PROMPT "1  CONSULTA STOCK       " MESSAGE "Ingreso de la producci¢n"
        @10,28 PROMPT "2  AUMENTA EXISTENCIAS  " MESSAGE "Rebaja stock de mercaderia"
        @12,28 PROMPT "3  REBAJA EXISTENCIA    " MESSAGE "Muestra por pantalla stock"
        @14,28 PROMPT "4  HISTORIAL PRODUCCION " MESSAGE "Producci¢n ingresada" 
        @16,28 PROMPT "5  TERMINA              " MESSAGE "Termina El Programa"
        SET CURSOR OFF
        MENU TO OPC
        SET COLOR TO BR+/N,R+/N

        DO CASE
                CASE OPC=2
                ******************************
                ****************** AUMENTA EXISTENCIAS

                        SELE 2
                        GO TOP
                        COLORE=SETCOLOR()
                        SAVE SCREEN TO PANTA1
                        @04,14 SAY "     I N G R E S O    D E    P R O D U C C I O N     "
                        @05,14 SAY "                                                     "
                        @19,14 SAY " <ESC>termina proceso      <ENTER>ingresa PRODUCCION "
                        SET COLOR TO W/N,N/W
                        @06,14 TO 18,66
                        KEYBOARD CHR(91)
                        SET ESCAPE ON
                        SET COLOR TO R+/N,GR/W
                        COLORES=SETCOLOR()

                        DBEDIT(06,15,18,65,V_CAMPO2,"PREGART")
                        SET ESCAPE OFF
                        RESTORE SCREEN FROM PANTA1
                        SET COLOR TO (COLORE)

                CASE OPC=3
                *****************************
                ***************** REBAJA EXISTENCIAS

                        SELE 2
                        GO TOP
                        COLORE=SETCOLOR()
                        SAVE SCREEN TO PANTA1
                        @04,14 SAY "       S A L I D A    D E    M E R C A D E R I A     "
                        @05,14 SAY "                                                     "
                        @19,14 SAY " <ESC>termina proceso      <ENTER>ingresa REBAJA     "
                        SET COLOR TO W/N,N/W
                        @06,05 TO 18,75
                        KEYBOARD CHR(91)
                        SET ESCAPE ON
                        SET COLOR TO R+/N,GR/W
                        COLORES=SETCOLOR()

                        DBEDIT(06,06,18,74,V_CAMPO3,"PREGART2")
                        SET ESCAPE OFF
                        RESTORE SCREEN FROM PANTA1
                        SET COLOR TO (COLORE)


                CASE OPC=1
                        *******************
                        ******** LISTA STOCK

                        SELE 2
                        GO TOP
                        COLORE=SETCOLOR()
                        SAVE SCREEN TO PANTA1
                        @04,14 SAY "          C O N S U L T A     S T O C K              "
                        @05,14 SAY "                                                     "
                        @19,14 SAY " <ESC> Concluye Consulta     <I>imprime STOCK"
                        SET COLOR TO B+/N,N/W
                        @06,13 TO 18,67
                        KEYBOARD CHR(91)
                        SET ESCAPE ON
                        SET COLOR TO GR/W,R+/N
                        COLORES=SETCOLOR()

                        DBEDIT(06,14,18,66,V_CAMPO,"PREGART0")
                        SET ESCAPE OFF
                        RESTORE SCREEN FROM PANTA1
                        SET COLOR TO (COLORE)
                CASE OPC=4
                ****************************
                ***********  LISTADO DE PRODUCCION INGRESADA


                        SELE 1
                        GO TOP
                        COLORES=SETCOLOR()
                        SAVE SCREEN TO PANTA1
                        @04,14 SAY "         HISTORIAL DE LA PRODUCCION INGRESADA        "
                        @05,14 SAY "                                                     "
                        @19,14 SAY " <ESC> Concluye Consulta "
                        SET COLOR TO B+/N,N/W
                        @06,09 TO 18,77
                        KEYBOARD CHR(91)
                        SET ESCAPE ON
                        DBEDIT(06,10,18,76,"","PREGART0")
                        SET ESCAPE OFF
                        RESTORE SCREEN FROM PANTA1
                        SET COLOR TO (COLORES)



                CASE OPC=5 .OR. OPC=0
                        EXIT
        ENDCASE
ENDDO
RETURN

*************************************
********** CONSULTA STOCK

FUNCTION PREGART0

IF LASTKEY()=27
        SET COLOR TO (COLORES)

        RETURN(0)
ELSE
        IF LASTKEY()=73
                SET DEVICE TO PRINTER
                SET PRINTER ON
                SET CONSOLE OFF
                SETPRC()
       *         CLEAR
                @00,00 SAY IRO0+IRO1
                @01,00 SAY IRO2
                @02,00 SAY IRO3
                GO TOP
                FS=65
                GO BOTTOM
                TOT_REG=RECNO()
                GO TOP
                FOR XX = 1 TO TOT_REG
                        IF FS=65
                              *  WAIT
                              *  CLEAR
                                FS=8
                                @5,00 SAY "___________________________ S T O C K   A C T U A L ____________________________"
                                @5,72 SAY DATE()
                                @7,00 SAY "------- STOCK ----- A  R  T  I  C  U  L  O --------------------- VALOR ---------"

                        
                        ENDIF
                        FS=FS+1
                        @FS,01 SAY STOCK PICT "9,999,999,999"
                        @FS,15 SAY DETALLE
                        @FS,56 SAY "$"
                        @FS,57 SAY PRECIO PICT "99,999,999.99"
                        SKIP
                NEXT
        *        WAIT
                ? " "
                EJECT
                SET DEVICE TO SCREEN
                SET PRINTER OFF
                SET CONSOLE ON
                GO TOP
                KEYBOARD CHR(91) 
                RETURN(1)
        ELSE

                SET COLOR TO (COLORES)
                RETURN(1)
        ENDIF
ENDIF







FUNCTION PREGART
PARAMETER MODO,POS

IF MODO<4
        SET COLOR TO (COLORES)

        RETURN(1)
ENDIF
DO CASE
CASE LASTKEY()=27
        ******** INGRESA
        SUM CANTIDAD TO ACUM_STOCK
        GO TOP
        IF ACUM_STOCK = 0
        SET COLOR TO (COLORES)

                RETURN(0)
        ELSE
                TONE (100,2)
                DO WHILE .T.
                        DO TECLA WITH "(R)egistra, (C)ontinua, (A)nula ?"
                        IF LASTKEY()=82 .OR. LASTKEY()=67 .OR. LASTKEY()=65
                                EXIT
                        ENDIF
                ENDDO
                IF LASTKEY()=82
                        GO TOP
                        DO WHILE .NOT. EOF()
                                XCANTIDAD = CANTIDAD
                                XSTOCK = STOCK
                                XSTOCK = XSTOCK + XCANTIDAD

                                REPLACE STOCK WITH XSTOCK
                                SKIP 
                        ENDDO
                ENDIF
                IF LASTKEY()=67
        SET COLOR TO (COLORES)

                        RETURN(1)
                ENDIF
                GO TOP
                DO WHILE .NOT. EOF()
                        REPLACE CANTIDAD WITH 0
                        SKIP 
                ENDDO
                IF LASTKEY()=82
                        SET COLOR TO Y+/B,B/W+
                        @24,00 SAY REPLICATE("±°",40)
                        SET CURSOR ON

                        SET COLOR TO W/B,B/W

                        XXFECHA=DATE()
                        N_PROD=SPACE(25)
                        N_FOLIO=SPACE(15)
                        
                        @21,09 CLEAR TO 23,68
                        SELE 1
                        @21,10 SAY "PRODUCCION INGRESADA :"
                        @21,32 SAY ACUM_STOCK PICT "9,999,999,999"
                        @22,10 SAY "OPERARIO  : "
                        @22,22 GET N_PROD
                        @23,10 SAY "FECHA PRODUCCION : "
                        @23,29 GET XXFECHA PICT "99/99/99"
                        @23,38 SAY "FOLIO/ORIGEN : "
                        @23,53 GET N_FOLIO
                        READ
                        APPEND BLAN
                        REPLA OPERARIO WITH N_PROD
                        REPLA PRODUCCION WITH ACUM_STOCK
                        REPLA FECHA WITH XXFECHA
                        REPLA FOLIO WITH N_FOLIO
                        SET CURSOR OFF
                        SELE 2
                        GO TOP
                        DO TECLA WITH "STOCK ACTUALIZADO CON PRODUCCION INGRESADA"

                        SET COLOR TO Y+/G,B/W+
                        FOR FL=21 TO 23
                                @FL,00 SAY REPLICATE("±°",40)
                        NEXT
                        SET COLOR TO W/N,N/W


                ENDIF

                IF LASTKEY()=65
                        DO TECLA WITH "LA PRODUCCION INGRESADA FUE ANULADA"
                ENDIF
                GO TOP
        SET COLOR TO (COLORES)

                RETURN(2)
        ENDIF
        SET COLOR TO (COLORES)

        GO TOP
        RETURN(0)
CASE LASTKEY()=13 
        ******** SELECCIONO UN ARTICULO
        IF .NOT. EOF()
             IF POS=1
                     SET COLOR TO W+/N,W/GR+
                     @ROW(),COL() GET CANTIDAD
                     READ
                     SET COLOR TO W/N,N/W
                     
             ENDIF
        ENDIF
        SET COLOR TO (COLORES)

        RETURN(1)
OTHERWISE
        SET COLOR TO (COLORES)

        RETURN(1)
ENDCASE

*************************************
********** REBAJA STOCK

FUNCTION PREGART2
PARAMETER MODO,POS

IF MODO<4

        SET COLOR TO (COLORES)
        RETURN(1)
ENDIF
DO CASE
CASE LASTKEY()=27
        ******** NO INGRESA
        SUM CANTIDAD TO ACUM_STOCK
        GO TOP
        IF ACUM_STOCK = 0
        SET COLOR TO (COLORES)

                RETURN(0)
        ELSE
                TONE (100,2)
                DO WHILE .T.
                        DO TECLA WITH "(R)ebaja, (C)ontinua, (A)nula ?"
                        IF LASTKEY()=82 .OR. LASTKEY()=67 .OR. LASTKEY()=65
                                EXIT
                        ENDIF
                ENDDO
                IF LASTKEY()=82
                        GO TOP
                        DO WHILE .NOT. EOF()
                                XCANTIDAD = CANTIDAD
                                XSTOCK = STOCK
                                XSTOCK = XSTOCK - XCANTIDAD
                                REPLACE STOCK WITH XSTOCK
                                SKIP 
                        ENDDO
                ENDIF
                IF LASTKEY()=67
        SET COLOR TO (COLORES)

                        RETURN(1)
                ENDIF
                GO TOP
                DO WHILE .NOT. EOF()
                        REPLACE CANTIDAD WITH 0
                        SKIP 
                ENDDO
                IF LASTKEY()=82
                        DO TECLA WITH "STOCK ACTUALIZADO CON REBAJA INGRESADA"
                ENDIF
                IF LASTKEY()=65
                        DO TECLA WITH "LA REBAJA INGRESADA FUE ANULADA"
                ENDIF
                GO TOP
        SET COLOR TO (COLORES)

                RETURN(2)
        ENDIF
        SET COLOR TO (COLORES)

        RETURN(0)
CASE LASTKEY()=13 
        ******** SELECCIONO UN ARTICULO
        IF .NOT. EOF()
             IF POS=1 .AND. STOCK>0
                     SET COLOR TO W+/N,W/GR+
                     XCANTIDAD = 0
                     XSTOCK = STOCK
                     @ROW(),COL() GET XCANTIDAD PICT "9999999"
                     READ
                     IF XCANTIDAD > XSTOCK
                        DO TECLA WITH "ERROR !! CANTIDAD A REBAJAR SUPERIOR A STOCK"
                     ELSE
                        REPLA CANTIDAD WITH XCANTIDAD 
                     ENDIF
                     SET COLOR TO W/N,N/W
                     
             ENDIF
        ENDIF
        SET COLOR TO (COLORES)

        RETURN(1)
OTHERWISE
        SET COLOR TO (COLORES)

	RETURN(1)
ENDCASE







PROCEDURE TECLA
PARAMETER MENSAJE
        LEN_M=80-LEN(MENSAJE)
        TRA_M=LEN_M/2
        XCOLOR=SETCOLOR() 
        SAVE SCREEN TO PANTA
        SET COLOR TO BR+/N,R+/N

        @24,0 SAY REPLICATE("-",TRA_M)
        @24,TRA_M SAY MENSAJE
        INKEY(0)
        
        RESTORE SCREEN FROM PANTA
        SET COLOR TO (XCOLOR)
        RETURN                       

PROCEDURE FONDO
        FOR FL=0 TO 24
                @FL,00 SAY REPLICATE("±°",40)
        NEXT
        RETURN
                                         
