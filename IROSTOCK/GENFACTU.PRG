*MODULO EMISION DE FACTURAS
*CLIENTE ENVASES IRO
*GENFACTU.PRG
*********************** LINEAS = 22 EN FACTURA

        MAXLIN = 22
        SET FIXED ON
        SET DECIMAL TO 0
        DECLARE COLCANTFACT[MAXLIN]
        DECLARE COLDETAFACT[MAXLIN]
        DECLARE COLPRECFACT[MAXLIN]
        DECLARE COLTOTAFACT[MAXLIN]
        DECLARE V_CAMPO[2]
        V_CAMPO[1]="DETALLE"
        V_CAMPO[2]="PRECIO"
        VALORIVA=0.19
        APROX=5.0

DO WHILE .T.
        SET COLOR TO W/B
        CLEAR
        DO FORMFAC.PRG
        SET COLOR TO Y+/B,B/W+
        @00,00 SAY IRO0
        @00,25 SAY "F  A  C  T  U  R  A"

        @01,04 SAY IRO1
        SET COLOR TO W/B

        STORE 0 TO XDIA,XCANTIDAD,XPRECIO,XTOTAL,XNETO,XIVA,XTOTAL
        STORE 0 TO NUM_FAC
        STORE SPACE (8) TO XFECHA
        STORE SPACE (14) TO XOCOMPRA
        STORE SPACE (24) TO XGD

        STORE 0 TO XRUT
        STORE SPACE (35) TO XNOMBRE,XDIRECCION
        STORE SPACE (15) TO XCOMUNA,XFONO,XCV
        STORE SPACE (20) TO XGIRO
        STORE SPACE (40) TO XARTICULO
        STORE SPACE (50) TO XSON1,XSON2
        SET COLOR TO W/R
        @01,60 SAY "0 = PARA TERMINA"
        SET COLOR TO W/B
        SELE 2
        GO BOTTOM
        IF .NOT. EOF()
                NUM_FAC=N_FACTURA+1
        ELSE
                NUM_FAC=1
        ENDIF
  *      @0,49 TO 2,57 DOUBLE
  *      @1,50 GET NUM_FAC PICT "9999999"
  *      READ
  *      IF NUM_FAC<1
  *              EXIT
  *      ENDIF
  *      LOCA ALL FOR N_FACTURA=NUM_FAC
  *      IF FOUND()
  *              DO TECLA WITH "NUMERO DE FACTURA YA FUE EMITIDA"
  *              LOOP
  *      ENDIF
        @01,60 SAY "                "
        SET COLOR TO W/R
        @01,60 SAY "RUT = 0 TERMINA"
        SET COLOR TO W/B

        DO WHILE .T.
                XRUT=0
                XRUTCLI=SPACE(12)
                SET KEY -2 TO LISTACLIENTES
                SET COLOR TO W/R
                @02,60 SAY "<F3> LISTAR CLIENTES"
                SET COLOR TO W/B

                @3,65 GET XRUT PICT "999"
                READ
                SET KEY -2 TO
                IF XRUT=0
                        EXIT
                ENDIF
                SELE 1
                LOCA ALL FOR CODIGO=XRUT
                IF FOUND()
                @01,60 SAY "                     "
                @02,60 SAY "                     "

                        XRUTCLI=RUT
                        XNOMBRE=NOMBRE     
                        XDIRECCION=DIRECCION
                        XCOMUNA=COMUNA
                        XGIRO=GIRO
                        XFONO=FONO
                        EXIT
                ELSE
                        DO TECLA WITH "CLIENTE NO EXISTE... DEBE CREARLO"
                        LOOP
                ENDIF
        ENDDO
        IF XRUT=0
                EXIT
        ENDIF
        SET COLOR TO BR+/N,R+/N

        @3,65 SAY XRUTCLI PICT "99.999.999-A"
        @3,14 SAY XNOMBRE PICT "@X"
        @4,14 SAY XDIRECCION PICT "@X"
        @4,65 SAY XCOMUNA PICT "@X"
        @5,37 SAY XGIRO PICT "@X"
        @5,65 SAY XFONO PICT "@X"

        @5,16 GET XOCOMPRA PICT "@X"
        @6,25 GET XGD PICT "@X"
        @6,65 GET XCV PICT "@X"
        READ
        DO WHILE .T.
                XXFECHA=DTOC(DATE())
                @2,14 GET XXFECHA PICT "99/99/99"
                READ
                XDIA=SUBSTR(XXFECHA,1,2)
                XFECHA=XDIA+" de"
                XANNO=SUBSTR(XXFECHA,7,2)
              *  IF VAL(XANNO)>7
              *          XANNO="19"+XANNO
              *  ELSE
                        XANNO="20"+XANNO
              *  ENDIF
                XMES=SUBSTR(XXFECHA,4,2)
                IF VAL(XMES)>0 .AND. VAL(XMES)<13
                        XFECHA=XFECHA+MESES[VAL(XMES)]+"de "+XANNO
                        EXIT
                ENDIF
        ENDDO
        @2,14 SAY XFECHA 
        SET COLOR TO W/B

        COLORES=SETCOLOR()
        SET COLOR TO GR+
        SAVE SCREEN TO PANTA1
        CONFIRMAFAC=SPACE(1)
        @09,14 CLEAR TO 11,60
        @09,14 TO 11,60

        DO WHILE CONFIRMAFAC#"S" .AND. CONFIRMAFAC#"N"
                @10,15 SAY "CONFIRMA DATOS DEL CLIENTE EN FACTURA S/N ?" GET CONFIRMAFAC PICT "A"
                READ
        ENDDO
        RESTORE SCREEN FROM PANTA1
        SET COLOR TO (COLORES)
        IF CONFIRMAFAC="N"
                LOOP
        ENDIF
        FILA=8
        MAXFILA=1
        STORE 0 TO XIVA,XNETO,XTOTALFAC
       
        DO WHILE .T.
        **** loop principal de ingreso de articulos en factura
        ****
                SET FIXED OFF
                IF MAXFILA=14
                        FOR II=8 TO 16
                                @II,0 SAY " "
                                @II,1 SAY REPLICATE (".",79)
                        NEXT
                        FOR II=17 TO 20
                                @II,0 SAY " "
                                @II,1 SAY REPLICATE ("ß",79)
                        NEXT

                        FILA = 8
                ENDIF
                IF MAXFILA>MAXLIN
                        EXIT                      
                ENDIF
                @FILA,0 SAY MAXFILA PICT "99"
                @FILA,3 GET XCANTIDAD PICT "9,999,999"
                READ
                IF XCANTIDAD=0
                        SAVE SCREEN TO PANTA1

                        OPCION=SPACE(1)
                        COLORES=SETCOLOR()
                        SET COLOR TO GR+
                        @22,17 CLEAR TO 24,48
                        @22,17 TO 24,48

                        DO WHILE OPCION#"S" .AND. OPCION#"N"
                                
                                @23,18 SAY "INGRESAR MAS ARTICULOS S/N ?" GET OPCION PICT "A"
                                READ
                        ENDDO
                        RESTORE SCREEN FROM PANTA1
                        SET COLOR TO (COLORES)
                        IF OPCION="S"
                                LOOP
                        ELSE
                                EXIT
                        ENDIF

                ENDIF
                SELE 3
                GO TOP
                COLORES=SETCOLOR()
                SAVE SCREEN TO PANTA1
                SET COLOR TO GR+/N+
                @09,11 TO 19,69 DOUBLE
                KEYBOARD CHR(91)
                @19,12 SAY " <ESC> no selecciona ning£n art¡culo  <ENTER> selecciona "
                SET ESCAPE ON
                DBEDIT(10,12,18,68,V_CAMPO,"PREGART")
                SET ESCAPE OFF
                RESTORE SCREEN FROM PANTA1
                SET COLOR TO (COLORES)
                IF LASTKEY()=27
                        LOOP
                ENDIF
                @FILA,14 GET XARTICULO PICT  "@X"
                READ                             

                @FILA,57 GET XPRECIO PICT "99,999.99"
                READ
                IF XPRECIO=0 .OR. XARTICULO=SPACE(40)
                        LOOP
                ELSE
                        SET FIXED ON
                        XTOTAL=XCANTIDAD*XPRECIO
                        RESTO = (XTOTAL - INT (XTOTAL))*10
                        IF RESTO > APROX .OR. RESTO = APROX
                                XTOTAL = INT(XTOTAL) + 1
                        ELSE
                                XTOTAL = INT(XTOTAL)
                        ENDIF

                        TOPENETO=XNETO+XTOTAL
                        IF TOPENETO>999999999 .OR. XTOTAL>999999999
                                TONE(300,1)
                                DO TECLA WITH "LA VENTA NO PUEDE SUPERAR $ 999.999.999"
                                LOOP
                        ENDIF

                        @FILA,68 SAY XTOTAL PICT   "999,999,999"
                        SAVE SCREEN TO PANTAX
                        CONFIRMA=SPACE(1)
                        SET COLOR TO BR+/N,R+/N
                        @22,10 CLEAR TO 24,42
                        @22,10 TO 24,42

                        DO WHILE CONFIRMA#"S" .AND. CONFIRMA#"N"
                                @23,11 SAY "CONFIRMA LINEA INGRESADA S/N:" GET CONFIRMA PICT "A"
                                READ
                        ENDDO
                        SET COLOR TO (COLORES)
                        RESTORE SCREEN FROM PANTAX
                        IF CONFIRMA="N"
                                LOOP
                        ENDIF
                        XNETO=XNETO+XTOTAL
                        COLCANTFACT[MAXFILA]=XCANTIDAD
                        COLDETAFACT[MAXFILA]=XARTICULO
                        COLPRECFACT[MAXFILA]=XPRECIO
                        COLTOTAFACT[MAXFILA]=XTOTAL
                        XNETO = INT(XNETO)
                        XIVA = XNETO * VALORIVA
                  *      RESTO = MOD (XIVA,100)

                        RESTO = (XIVA - INT (XIVA))*10
                        IF RESTO > APROX .OR. RESTO = APROX
                                XIVA = INT(XIVA) + 1
                        ELSE
                                XIVA = INT(XIVA)
                        ENDIF

                     *   XIVA=INT(XIVA/100)
                     *   IF RESTO > = APROX
                     *           XIVA=XIVA+1
                     *   ENDIF
                       
                        XTOTALFAC=XNETO+XIVA
                        @22,68 SAY XNETO  PICT    "999,999,999"
                        @23,68 SAY XIVA   PICT    "999,999,999"
                        @24,68 SAY XTOTALFAC PICT "999,999,999"
                        SELE 3
                        REPLACE DETALLE WITH XARTICULO
                        REPLACE PRECIO WITH XPRECIO
                        COMMIT
                        FILA=FILA+1
                        MAXFILA=MAXFILA+1
                        STORE 0 TO XCANTIDAD,XPRECIO
                        STORE SPACE(40) TO XARTICULO
                ENDIF
        ENDDO
        IF XTOTALFAC>0
                SELE 1
                REPLA T_VENTAS WITH XTOTALFAC
                CTOTALFAC = T_VENTAS
                STORE SPACE(50) TO XSON1,XSON2
                DO M_ESCRIT  
                @22,7 GET XSON1 
                @23,7 GET XSON2
                READ
                ************** SE GRABA Y/O IMPRIME FACTURA
                OPCIONPRINT=SPACE(1)
                OPCIONGRABA="S"
                TONE(300,1)
                SET COLOR TO W/G+
                @13,25 CLEAR TO 15,48
                @13,25 TO 15,48 DOUBLE
             *   DO WHILE OPCIONGRABA#"S" .AND. OPCIONGRABA#"N"
             *           @13,26 SAY "REGISTRA FACTURA S/N" GET OPCIONGRABA PICT "A"
             *           READ
             *   ENDDO
             *   IF OPCIONGRABA="S"
                        DO WHILE OPCIONPRINT#"S" .AND. OPCIONPRINT#"N"
                                @14,26 SAY "IMPRIME  FACTURA S/N" GET OPCIONPRINT PICT "A"
                                READ
                        ENDDO
             *   ENDIF
                IF OPCIONGRABA="S"

                  *      SELE 1
                  *      LOCATE ALL FOR CODIGO = XRUT
                  *      IF .NOT. FOUND()
                  *              APPEND BLANK
                  *              NUM_REG=RECNO()
                  *              REPLA CODIGO WITH NUM_REG
                  *      ENDIF
                  *      REPLA RUT WITH XRUTCLI
                  *      REPLA NOMBRE WITH XNOMBRE
                  *      REPLA DIRECCION WITH XDIRECCION
                  *      REPLA COMUNA WITH XCOMUNA
                  *      REPLA FONO WITH XFONO
                  *      REPLA GIRO WITH XGIRO
                  *      REPLA U_FACTURA WITH NUM_FAC
                  *      XTF=T_VENTAS+XTOTALFAC
                  *      REPLA T_VENTAS WITH XTF
                  *      COMMIT
                  *      SELE 2
                  *      APPEND BLANK
                  *      REPLA RUT WITH XRUT
                  *      REPLA OCOMPRA WITH XOCOMPRA
                  *      REPLA GD WITH XGD
                  *      REPLA CV WITH XCV
                  *      REPLA N_FACTURA WITH NUM_FAC
                  *      REPLA FECHA WITH CTOD(XXFECHA)
                  *      REPLA CORREL WITH MAXFILA
                  *      REPLA NETO WITH XNETO
                  *      REPLA IVA WITH XIVA
                  *      REPLA TOTAL WITH XTOTALFAC
                  *      COMMIT
                   *     SELE 4
                   *     FOR C=1 TO MAXFILA
                   *             APPEND BLANK
                   *             REPLA N_FACTURA WITH NUM_FAC
                   *             REPLA CORREL WITH C
                   *             REPLA CANTIDAD WITH COLCANTFACT[C]
                   *             REPLA ARTICULO WITH COLDETAFACT[C]
                   *             REPLA PRECIO WITH   COLPRECFACT[C]
                   *             REPLA TOTAL WITH    COLTOTAFACT[C]
                   *     NEXT
                   *     COMMIT
                    ***    DO TECLA WITH "FACTURA GRABADA SATISFACTORIAMENTE"
                        IF OPCIONPRINT="S"
                                IF ISPRINTER()
                                        TONE(300,1)
                                        SET COLOR TO W/B*
                                        @10,5 CLEAR TO 14,45
                                        @11,6 SAY "ENCIENDA IMPRESORA Y COLOQUE FACTURA"
                                        @12,6 SAY "LUEGO PRESION UNA TECLA PARA SEGUIR "
                                        INKEY(0)
                                        @13,6 SAY "IMPRIMIENDO ....................... "
                                        SET COLOR TO
                                        DO PRINFAC
                                ELSE
                                        DO TECLA WITH "E R R O R !  NO SE DETECTO IMPRESORA"
                                ENDIF
                        ENDIF
                ENDIF
        ENDIF
ENDDO
RETURN

FUNCTION PREGART
PARAMETER MODO,POS
IF MODO<4
        RETURN(1)
ENDIF
DO CASE
CASE LASTKEY()=27
        ******** NO INGRESA
        RETURN(0)
CASE LASTKEY()=13 
        ******** SELECCIONO UN ARTICULO
        IF .NOT. EOF()
             XARTICULO=DETALLE
             XPRECIO=PRECIO
        ENDIF
        RETURN(0)
OTHERWISE
	RETURN(1)
ENDCASE

PROCEDURE LISTACLIENTES
SET KEY -2 TO 
SAVE SCREEN TO PANTARUT
SET COLOR TO W/G
SELE 1
GO TOP
@21,5 SAY "     SELECCIONE UN CLIENTE CON <ENTER> O <ESCAPE>            "
DBEDIT(10,5,20,65)
SET COLOR TO W/B
IF .NOT. EOF()
        XRUT=CODIGO
ENDIF
RESTORE SCREEN FROM PANTARUT
SET KEY -2 TO LISTACLIENTES
RETURN


