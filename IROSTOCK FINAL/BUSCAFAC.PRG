**********
**** MODULO BUSCAFAC.PRG    LISTA POR PANTALLA FACTURA EMITIDA
*******
DECLARE VECTORCLI[4]
                        VECTORCLI[1]="CODIGO"
                        VECTORCLI[2]="NOMBRE"
                        VECTORCLI[3]="U_FACTURA"
                        VECTORCLI[4]="T_VENTAS"
DECLARE VECTORFAC[3]
                        VECTORFAC[1]="N_FACTURA"
                        VECTORFAC[2]="FECHA"
                        VECTORFAC[3]="NETO"

                        DECLARE COLCANTFACT[13]
                        DECLARE COLDETAFACT[13]
                        DECLARE COLPRECFACT[13]
                        DECLARE COLTOTAFACT[13]

SAVE SCREEN TO PANTAMENU

DO WHILE .T.
        RESTORE SCREEN FROM PANTAMENU
        OPF=4
        SET COLOR TO R+/Y,B/W+
        @14,59 TO 17,59
        @13,59 SAY    "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
        @14,56 SAY "ÃÄÄ´"
        @15,59 TO 17,59

        SET COLOR TO W/B+
        @24,00 SAY REPLICATE(" ",80)

        @14,60 PROMPT " 1. POR FECHAS  " MESSAGE "LISTA FACTURAS EMITIDAS POR FECHA"
        @15,60 PROMPT " 2. POR CLIENTE " MESSAGE "TODAS LAS FACTURAS EMITIDAS A UN CLIENTE"
        @16,60 PROMPT " 3. POR NUMERO  " MESSAGE "MUESTRA LA FACTURA CONSULTADA"
        @17,60 PROMPT " 4. VUELVE      " MESSAGE "VUELVE"
        MENU TO OPF
        
        IF OPF=4 .OR. OPF=0
                EXIT
        ENDIF
        IF OPF=1
                DO WHILE .T.
                        SET COLOR TO Y+/B,B/W+
                        CLEAR
                        DO FONDO
                        @00,00 SAY IRO0
                        @01,04 SAY IRO1
                        SET ESCAPE ON
                        SET COLOR TO G+/B,B/W+
                        FECINI=DATE()
                        FECINI=DTOC(FECINI)
                        STORE CTOD(FECINI) TO FECINI,FECFIN
                        
                        @0,15 SAY "LISTADO DE FACTURAS EMITIDAS"
                        @1,15 SAY "INDIQUE ENTRE QUE FECHAS SE CONSULTAN "
                        @3,42 SAY "<ESC> PARA SALIR"
                        @3,15 SAY "FECHA INICIAL :" GET FECINI PICT "99/99/99"
                        @4,15 SAY "FECHA TERMINO :" GET FECFIN PICT "99/99/99"
                        READ
                        IF LASTKEY()=27
                                EXIT
                        ENDIF
                        SELE 2
                        SORT TO FAC_SORT ON FECHA  
                        USE
                        DELETE FILE FACTURA.DBF
                        RENAME FAC_SORT.DBF TO FACTURA.DBF
                        USE FACTURA
                        IF FECFIN=FECINI
                                LOCATE ALL FOR FECHA=FECINI 

                        ELSE
                                LOCATE ALL FOR (FECHA>FECINI .OR. FECHA=FECINI) .AND. (FECHA<FECFIN .OR. FECHA=FECFIN)
                        ENDIF
                        FILA=23
                        CUENTATOT=0
                        CUENTASUB=0
                        DO WHILE .NOT. EOF()
                                FILA=FILA+1
                                IF FILA=24
                                        SET COLOR TO G/R+
                                        CLEAR
                                        SET COLOR TO G+/B,B/W+
                                        @0,00 SAY "ÄÄÄÄÄÄÄÄ FACTURAS EMITIDAS ENTRE : "
                                        SET COLOR TO G/R+
                                        
                                        @0,35 SAY DTOC(FECINI)
                                        SET COLOR TO G+/B,B/W+

                                        @0,43 SAY " Y "
                                        SET COLOR TO G/R+

                                        @0,46 SAY DTOC(FECFIN)
                                        SET COLOR TO G+/B,B/W+

                                        @0,54 SAY " (AMBAS INCLUIDAS) ÄÄÄÄÄÄÄ"
                                        @1,00 SAY " CLI -   NOMBRE      -  FAC - FEC. - O.COMPRA   -   G/D  - C.VTA.    -  TOTAL   "
                                        @2,00 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                        SET COLOR TO W/G+
                                        FILA=3
                                ENDIF
                                XRUT=RUT
                                SELE 1
                                LOCA ALL FOR CODIGO=XRUT
                                XNOMBRE=NOMBRE
                                SELE 2
                                @FILA,0 SAY RUT PICT "9999"
                                @FILA,5 SAY XNOMBRE PICT "XXXXXXXXXXXXXXX"
                                @FILA,20 SAY N_FACTURA PICT "9999999"
                                @FILA,28 SAY FECHA 
                                @FILA,37 SAY OCOMPRA PICT "XXXXXXXXXX"
                                @FILA,48 SAY GD      PICT "XXXXXXXXXX"
                                @FILA,59 SAY CV      PICT "XXXXXXX"
                                @FILA,67 SAY TOTAL PICT "9,999,999,999"
                                CUENTASUB=CUENTASUB+TOTAL
                                CUENTATOT=CUENTATOT+TOTAL
                                CONTINUE
                                IF .NOT. EOF() 
                                        IF FILA=21
                                                @FILA+2,38 SAY "SUB-TOTAL FACTURADO ...... $"
                                                @FILA+2,67 SAY CUENTASUB PICT "9,999,999,999"
                                                DO TECLA WITH "PRESIONE UNA TECLA PARA CONTINUAR LISTADO"
                                                CUENTASUB=0
                                                FILA=23
                                        ENDIF
                                ENDIF
                        ENDDO
                        IF FILA=23
                                FILA=4
                        ENDIF
                        @FILA+2,38 SAY "TOTAL FACTURADO EN PERIODO $"
                        @FILA+2,67 SAY CUENTATOT PICT "9,999,999,999"
                        DO TECLA WITH "PRESIONE UNA TECLA PARA CONTINUAR"
                        LOOP
                ENDDO
                LOOP
        ENDIF
        
        DO WHILE .T.
                SET COLOR TO Y+/B,B/W+
                CLEAR
                DO FONDO
                @00,00 SAY IRO0
                @01,04 SAY IRO1
                SET COLOR TO W/G
                IF OPF=2
                        XRUT=0
                        SET KEY -2 TO CLIENTEYFACTURA
                        @0,18 SAY "LISTADO DE FACTURAS EMITIDAS AL CLIENTE"
                        @2,33 SAY "0 = SALE  F3 = CLIENTES"
                        @2,18 SAY "CLIENTE :" GET XRUT PICT "999"
                        READ
                        SET KEY -2 TO 

                        IF XRUT=0
                                EXIT
                        ENDIF

                        SELE 1
                        GO TOP
                        LOCATE ALL FOR CODIGO=XRUT
                        IF .NOT. EOF()
                                XNOMBRE=NOMBRE
                                @2,33 SAY XNOMBRE
                        ELSE
                                DO TECLA WITH "CLIENTE NO EXISTE"
                                
                                LOOP
                        ENDIF
                        SELE 2
                        GO TOP
                        LOCATE ALL FOR XRUT=RUT 
                        FILA=23
                        CUENTATOT=0
                        CUENTASUB=0
                        DO WHILE .NOT. EOF()

                                FILA=FILA+1
                                IF FILA=24
                                        SET COLOR TO G/R+
                                        @6,0 CLEAR TO 24,79
                                        @3,0 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                        @4,0 SAY "  Nø FACTURA - FEC. - O.COMPRA -    G/D   -  C.VTA.   - NETO  - I.V.A. -   TOTAL"
                                        @5,0 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                        FILA=6
                                        SET COLOR TO W/G
                                ENDIF
                                @FILA,2 SAY N_FACTURA PICT "9999999"
                                @FILA,13 SAY FECHA PICT "99/99/99" 
                                @FILA,22 SAY OCOMPRA PICT "XXXXXXXXXX"
                                @FILA,33 SAY GD      PICT "XXXXXXXXXX"
                                @FILA,44 SAY CV      PICT "XXXXXXXXXX"
                                @FILA,55 SAY NETO PICT "9999999"
                                @FILA,63 SAY IVA  PICT "9999999"
                                @FILA,70 SAY TOTAL PICT "9999999999"
                                CUENTATOT=CUENTATOT+TOTAL
                                CUENTASUB=CUENTASUB+TOTAL
                                CONTINUE
                                IF .NOT. EOF() 
                                        IF FILA=21
                                                @FILA+2,38 SAY "SUB-TOTAL FACTURADO ...... $"
                                                @FILA+2,67 SAY CUENTASUB PICT "9,999,999,999"
                                                DO TECLA WITH "PRESIONE UNA TECLA PARA CONTINUAR LISTADO"
                                                CUENTASUB=0
                                                FILA=23
                                        ENDIF
                                ENDIF

                        ENDDO
                        IF FILA=23
                                FILA=4
                        ENDIF
                        @FILA+2,48 SAY "TOTAL FACTURADO  $"
                        @FILA+2,67 SAY CUENTATOT PICT "9,999,999,999"

                        DO TECLA WITH "PRESIONE UNA TECLA PARA CONTINUAR"
                        LOOP

                ELSE
                **********
                **** MUESTRA FACTURA EMITIDA
                **********

                        SET COLOR TO GR+/R
                        CLEAR
                        DO FORMFACX
                        STORE 0 TO NUM_FAC
                        SET COLOR TO R/GR+
                        @00,00 SAY IRO0
                        @01,04 SAY IRO1
                        SET COLOR TO B+/W
                        @02,49 SAY " 0 PARA SALIR"
                        @01,49 SAY "<F3> LISTA FACTURAS"
                        SET KEY -2 TO TODASFACTURAS

                        @00,49 GET NUM_FAC PICT "9999999"
                        READ
                        SET COLOR TO GR+/R
                        @02,49 SAY "             "
                        @01,49 SAY "                   "
                        SET COLOR TO B+/W
                        SET KEY -2 TO 

                        IF NUM_FAC=0
                                EXIT      
                        ENDIF
                ENDIF
                
                IF OPF=1
                        SELE 1
                        LOCA ALL FOR CODIGO=XRUT
                        IF EOF()
                                DO TECLA WITH "ERROR !, CLIENTE NO EXISTE"
                                LOOP
                        ELSE
                                NUM_FAC=U_FACTURA
                        ENDIF
                ENDIF
                SELE 2
                LOCA ALL FOR N_FACTURA=NUM_FAC
                IF EOF()
                        DO TECLA WITH "ERROR!, FACTURA NO EMITIDA"
                        LOOP
                ELSE
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
                        LOOP               
                ENDIF
                PFAC=" "
                @24,0 SAY "_____________PRESIONE UNA TECLA, (I)MPRIME" GET PFAC PICT "X"
                READ
                IF PFAC="I"
                        IF ISPRINTER()
                                XSON1=""
                                XSON2=""
                                DO M_ESCRIT
                                DO PRINFAC
                                DO TECLA WITH "O.K.........FACTURA IMPRESA"
                        ELSE
                                DO TECLA WITH "E R R O R  !  NO SE DETECTO NINGUNA IMPRESORA"
                        ENDIF

                ENDIF
        ENDDO
RESTORE SCREEN FROM PANTAMENU
ENDDO

RETURN


PROCEDURE CLIENTEYFACTURA
SET KEY -2 TO 
SAVE SCREEN TO PANTARUT
SET COLOR TO W/G
SELE 1
GO TOP
@21,5 SAY "     SELECCIONE UN CLIENTE CON <ENTER> O <ESCAPE>       "
@09,5 SAY "     L I S T A D O  D E  C L I E N T E S                "

DBEDIT(10,5,20,60,VECTORCLI)
SET COLOR TO 
IF .NOT. EOF()
        XRUT=CODIGO
ENDIF
RESTORE SCREEN FROM PANTARUT
SET KEY -2 TO CLIENTEYFACTURA
RETURN

PROCEDURE TODASFACTURAS
SET KEY -2 TO 
SAVE SCREEN TO PANTARUT
SET COLOR TO W/G
SELE 2
GO TOP
@21,5 SAY "     SELECCIONE UNA FACTURA CON <ENTER> O <ESCAPE>      "
@09,5 SAY " L I S T A D O  D E  F A C T U R A S   E M I T I D A S  "

DBEDIT(10,5,20,60,VECTORFAC)
SET COLOR TO
IF .NOT. EOF()
        NUM_FAC=N_FACTURA
ENDIF
RESTORE SCREEN FROM PANTARUT
SET KEY -2 TO TODASFACTURAS
RETURN
