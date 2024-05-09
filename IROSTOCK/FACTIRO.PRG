*********
**** MODULO FACTIRO.PRG
****
SET MESSAGE TO 24 CENTER
SET TALK OFF
SET BELL OFF
SET CONFIRM OFF
SET DATE BRIT
SET SAFETY OFF
SET WRAP ON
SET ESCAPE OFF


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
IF .NOT. FILE ("FACTURA.DBF")
         CLEAR
         @10,10 SAY "ERROR !!!! NO EXISTE EL ARCHIVO.FA0"
         @12,10 SAY "LLAMAR A SOPORTE BRAULIO 6323745.6331216"
         WAIT                  
         RETURN
ENDIF
IF .NOT. FILE ("DETALLE.DBF")
         CLEAR
         @10,10 SAY "ERROR !!!! NO EXISTE EL ARCHIVO.DE0"
         @12,10 SAY "LLAMAR A SOPORTE BRAULIO 6323745.6331216"
         WAIT                       
         RETURN
ENDIF

*****************************
************ BUSCA AUTORIZACION
*******************

**** DE IVAN
**** CHEQUEO="El n£mero de serie del volumen es B028-D90A"
**** DE PRUEBA EN PENDRIVE
**** CHEQUEO="Volume Serial Number is 453C-3907"
**** DE DISCO DURO D NOTEBOOK
**** CHEQUEO="Volume Serial Number is A409-9EC2"
**** DE DISCO DURO C NOTEBOOK
CHEQUEO="Volume Serial Number is 245D-39A1"

**** DE PENDRIVE DESDE OFICINA
**** CHEQUEO="El n£mero de serie del volumen es 453C-3907"


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
USE CLIENTE
SELE 2
USE FACTURA
SELE 3
USE ARTICULO
SELE 4
USE DETALLE
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


OPC=7

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
        DECLARE V_CAMPOM[2]
        V_CAMPOM[1]="DETALLE"
        V_CAMPOM[2]="PRECIO"


DO WHILE .T.
        SET COLOR TO Y+/B,B/W+
        CLEAR
        DO FONDO
        @00,00 SAY IRO0+IRO1
        @01,00 SAY IRO2
        @02,00 SAY IRO3
        @24,00 SAY REPLICATE(" ",80)
        @00,77 SAY AUTOR
        SET COLOR TO R+/Y,B/W+

        @02,24 SAY    "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
        @03,24 SAY    " G E S T I O N  F A C T U R A S ³"
        @04,24 SAY    "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
        @05,56 TO 19,56
        SET COLOR TO B+/B

        FOR FL=5 TO 19
                @FL,24 SAY REPLICATE ("þ",32)
        NEXT 

        SET COLOR TO W/B
        @06,25 PROMPT " 1 EMISION-CONTROL-REGISTRO   " MESSAGE "Controla Datos Ingresados para Generar Factura"
        @08,25 PROMPT " 2 EMISION SIN REGISTRO       " MESSAGE "Sin Ning£n Control de los Datos Ingresados"
        @10,25 PROMPT " 3 MANTENCION DE CLIENTES     " MESSAGE "Modifica o Agrega Clientes"
        @12,25 PROMPT " 4 MANTENCION DE ARTICULOS    " MESSAGE "Modifica o Agrega Articulos"
        SET COLOR TO N/B
        @14,25 SAY    " 5 CONSULTA POR EMITIDAS      "
        **** MESSAGE "Muestra por Pantalla o Imprime Factura Emitida"
        @16,25 SAY    " 6 ELIMINA ULTIMA EMITIDA     "
        **** MESSAGE "Elimina Solamente La Ultima Factura Emitida"
        SET COLOR TO W/B
        @18,25 PROMPT " 7 SALIDA                     " MESSAGE "Termina El Programa"

        MENU TO OPC
        SET COLOR TO BR+/N,R+/N

        DO CASE
                CASE OPC=1
                        DO GENFACTU.PRG
                CASE OPC=2
                        DO FACTBLAN.PRG
                CASE OPC=3
                        SET COLOR TO Y+/B,B/W+
                        CLEAR
                        DO FONDO
                        @00,00 SAY IRO0+IRO1
                        @01,00 SAY IRO2
                        @02,00 SAY IRO3
                        SET COLOR TO G+/B,B/W+

                        SELE 1
                        GO TOP
                        IF EOF()
                                APPEND BLAN
                                NUM_REG=RECNO()
                                REPLA CODIGO WITH NUM_REG
                                COMMIT
                        ENDIF
                        @24,10 SAY " <ENTER>modifica <I>crea nuevo <E>limina            <ESCAPE>termina "
                        @3,15 SAY "M A N T E N C I O N   D E   C L I E N T E S"
                        
                        *** SET COLOR TO BR+/N,R+/N
                        SET COLOR TO GR/W,R+/N

                        SORT TO CLI_SORT ON NOMBRE
                        USE
                        DELETE FILE CLIENTE.DBF
                        RENAME CLI_SORT.DBF TO CLIENTE.DBF
                        USE CLIENTE
                        DBEDIT(5,5,20,75,"","MANTIENE")
                        SET COLOR TO W/G
                        
                CASE OPC=4
                        SET COLOR TO Y+/B,B/W+
                        CLEAR
                        DO FONDO
                        @00,00 SAY IRO0+IRO1
                        @01,00 SAY IRO2
                        @02,00 SAY IRO3
                        SET COLOR TO G+/B,B/W+

                        SELE 3
                        GO TOP
                        IF EOF()
                                APPEND BLAN
                                NUM_REG=RECNO()
                                REPLA CODIGO WITH NUM_REG
                                COMMIT
                        ENDIF
                        @24,10 SAY " <ENTER>modifica <I>crea nuevo <E>limina            <ESCAPE>termina "
                        @3,15 SAY "M A N T E N C I O N   D E   A R T I C U L O S"
                        SET COLOR TO GR/W,R+/N

                        SORT TO ART_SORT ON DETALLE
                        USE
                        DELETE FILE ARTICULO.DBF
                        RENAME ART_SORT.DBF TO ARTICULO.DBF
                        USE ARTICULO
                        DBEDIT(5,5,20,75,V_CAMPOM,"MANTIENE")
                        SET COLOR TO W/G
       ***         CASE OPC=5
                        
                        **** DO BUSCAFAC
       ***         CASE OPC=6
                        ********************
                        ****** SE ELIMINARA ULTIMA FACTURA EMITIDA
                        ********************
                        **** DO ELIMFAC
                CASE OPC=5 .OR. OPC=0
                        EXIT
        ENDCASE
ENDDO
RETURN

FUNCTION MANTIENE
PARAMETER MODO,POSICION
IF MODO<4
        RETURN(1)
ENDIF
DO CASE
CASE LASTKEY()=ASC("I")
        APPEND BLANK
        NUM_REG=RECNO()
        REPLA CODIGO WITH NUM_REG
        COMMIT
        RETURN(2)
CASE LASTKEY()=ASC("E")
        SEELIMINO=.T.
        IF OPC=4
                DELETE
                PACK
                COMMIT
        ELSE
                IF OPC=3
                        NUM_CLI=CODIGO
                        SELE 2
                        LOCA ALL FOR RUT=NUM_CLI
                        IF FOUND()
                                SEELIMINO=.F.
                                SAVE SCREEN TO PANDEL
                                SET COLOR TO G+/R
                                @08,13 CLEAR TO 18,60
                                @08,13 TO 18,60
                                @10,15 SAY "PARA MANTENER LA INTEGRIDAD DE LA INFORMACION"
                                @12,15 SAY "NO SE PERMITE ELIMINAR UN CLIENTE QUE TENGA  "
                                @14,15 SAY "FACTURAS EMITIDAS                            "
                                @16,15 SAY "PRESIONE UN TECLA PARA SEGUIR EDICION........"
                                INKEY(0)
                                SET COLOR TO GR/W
                                RESTORE SCREEN FROM PANDEL
                        ELSE
                                SELE 1
                                REPLA RUT WITH ""
                                REPLA NOMBRE WITH ""
                                REPLA DIRECCION WITH ""
                                REPLA COMUNA WITH ""
                                REPLA GIRO WITH ""
                                REPLA FONO WITH ""
                                REPLA U_FACTURA WITH 0
                                REPLA T_VENTAS WITH 0
                                COMMIT
                        ENDIF
                        SELE 1
                ENDIF
                IF SEELIMINO
                        SAVE SCREEN TO PANDEL
                        SET COLOR TO W/R
                        @08,13 CLEAR TO 18,60
                        @08,13 TO 18,60
                        @10,15 SAY "NO IMPLEMENTADO 100%, SOLAMENTE SE LIMPIARAN "
                        @12,15 SAY "LOS DATOS DEL CLIENTE PARA SU PORTERIOR RE-  "
                        @14,15 SAY "UTILIZACION PARA UN NUEVO CLIENTE.           "
                        @16,15 SAY "PRESIONE UN TECLA PARA SEGUIR EDICION........"
                        INKEY(0)
                        SET COLOR TO GR/W
                        RESTORE SCREEN FROM PANDEL
                ENDIF
        ENDIF
        RETURN(2)
CASE LASTKEY()=27
        RETURN(0)
CASE LASTKEY()=13                   
        IF OPC=4
                SAVE SCREEN TO PANTA1
                SET ESCAPE ON
                SET COLOR TO W/B
                @10,15 CLEAR TO 16,70
                @10,15 TO 16,70
                SET CURSOR ON
                @24,10 SAY "                                                                    "
                @11,16 SAY "_____________INGRESE O CONFIRME DATOS DEL ARTICULO"
                @13,16 SAY "DETALLE     :" GET DETALLE  
                @14,16 SAY "PRECIO      :" GET PRECIO 
                READ
                SET CURSOR OFF
                SET ESCAPE OFF
                SET COLOR TO GR/W
                RESTORE SCREEN FROM PANTA1
                RETURN(2)
        ELSE
        IF OPC=3
                SAVE SCREEN TO PANTA1

                SET ESCAPE ON
                SET COLOR TO W/B
                @24,10 SAY "                                                                    "

                @10,15 CLEAR TO 20,65
                @10,15 TO 20,65
                SET CURSOR ON
                NUM_CLI=CODIGO
                SELE 2
                LOCA ALL FOR RUT=NUM_CLI
                IF FOUND()
                        CAMBIARUT=.F.
                        SET COLOR TO Y*/R

                        @12,16 SAY "              RUT con Factura Emitida No Cambia  "
                        SET COLOR TO W/B

                ELSE
                        CAMBIARUT=.T.
                ENDIF
                SELE 1
                @11,16 SAY "_____________INGRESE O CONFIRME DATOS DEL CLIENTE"

                IF CAMBIARUT
                        @14,16 SAY "NOMBRE      : "+NOMBRE
                        @15,16 SAY "DIRECCION   : "+DIRECCION
                        @16,16 SAY "COMUNA      : "+COMUNA
                        @17,16 SAY "GIRO        : "+GIRO
                        @18,16 SAY "FONO        : "+FONO

                        DO WHILE .T.
                                @13,16 SAY "RUT         :" GET RUT PICT "99.999.999-X"
                                READ      
                                rutbueno=.F.
                                rutval=rut
                                do VALRUT with rutval
                                if !rutbueno
                                        tone (1800,2)
                                        do tecla with "RUT NO VALIDO"
                                else
                                        exit
                                endif
                        ENDDO
                        @14,30 GET NOMBRE
                        @15,30 GET DIRECCION
                        @16,30 GET COMUNA
                        @17,30 GET GIRO
                        @18,30 GET FONO
                        READ
                ELSE
                        @13,16 SAY "RUT         : "+RUT
                        @14,16 SAY "NOMBRE      :" GET NOMBRE
                        @15,16 SAY "DIRECCION   :" GET DIRECCION
                        @16,16 SAY "COMUNA      :" GET COMUNA
                        @17,16 SAY "GIRO        :" GET GIRO
                        @18,16 SAY "FONO        :" GET FONO
                        READ
                ENDIF
                SET CURSOR OFF
                SET ESCAPE OFF
                SET COLOR TO GR/W
                RESTORE SCREEN FROM PANTA1
                RETURN(2)
        ENDIF
        ENDIF

ENDCASE
RETURN(1)

PROCEDURE TECLA
PARAMETER MENSAJE
        LEN_M=80-LEN(MENSAJE)
        TRA_M=LEN_M/2
        COLORES=SETCOLOR() 
        SAVE SCREEN TO PANTA
        SET COLOR TO BR+/N,R+/N

        @24,0 SAY REPLICATE("-",TRA_M)
        @24,TRA_M SAY MENSAJE
        INKEY(0)
        
        RESTORE SCREEN FROM PANTA
        SET COLOR TO (COLORES)
        RETURN                       

PROCEDURE FONDO
        FOR FL=0 TO 24
                @FL,00 SAY REPLICATE("±°",40)
        NEXT
        RETURN
                                         
PROCEDURE valrut
PARAMETERS rutt

ext=SUBSTR(rutt,12,1)
x=0
DECLARE divisor[9]
divisor[1]=3
divisor[2]=2
divisor[3]=7
divisor[4]=6
divisor[5]=5
divisor[6]=4
divisor[7]=3
divisor[8]=2
suma=0
rutt=SUBSTR(rutt,1,2)+SUBSTR(rutt,4,3)+SUBSTR(rutt,8,3)
if ext = "k"
    ext= "K"
endif
FOR x = 1 TO 8
    suma = SUMA + VAL(SUBSTR(rutt,x,1))* divisor [x]
NEXT
suma1 = int (suma / 11)
suma = suma - ( suma1 * 11 )
suma = 11 - suma
if (suma = 10 .and. ext = "K") .OR. (suma = 11 .and. ext = "0")
    rutbueno=.T.

else
    if suma = VAL(ext)
        rutbueno=.T.
    endif
endif

RETURN

