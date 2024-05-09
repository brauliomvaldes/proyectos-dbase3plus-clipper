*MODULO EMISION DE FACTURAS
*CLIENTE ENVASES IRO
*FACTURAS.PRG

SET BELL OFF
SET CONFIRM OFF
SET TALK OFF
SET DATE BRIT
SET SAFETY OFF
SET WRAP ON
SET ESCAPE ON
SET INTEN ON
DO WHILE .T.
        SET COLOR TO W/B
        CLEAR
        
        DO FORMFAC.PRG
        SET COLOR TO Y+/B,B/Y+
        @00,00 SAY IRO0
        @00,25 SAY "F  A  C  T  U  R  A"

        @01,04 SAY IRO1

        SET COLOR TO W/R

        @24,20 SAY "<ESCAPE> TERMINA O CANCELA INGRESO"
        @01,49 SAY "00000 NO SE REGISTRA EMISION" 

        STORE 0 TO XDIA,XANNO,XNETO,XIVA,XTOTAL,XTOTALFAC
        STORE SPACE (24) TO XGD
        STORE SPACE (14) TO XOCOMPRA
        STORE SPACE (10) TO XMES
        STORE SPACE (12) TO XRUT
        STORE SPACE (35) TO XNOMBRE,XDIRECCION
        STORE SPACE (15) TO XCOMUNA,XFONO,XCV
        STORE SPACE (20) TO XGIRO
        STORE SPACE (40) TO XARTICULO
        STORE SPACE (50) TO XSON1,XSON2
        STORE 0 TO XCANTIDAD1,XPRECIO1,XTOTAL1
        STORE 0 TO XCANTIDAD2,XPRECIO2,XTOTAL2   
        STORE 0 TO XCANTIDAD3,XPRECIO3,XTOTAL3
        STORE 0 TO XCANTIDAD4,XPRECIO4,XTOTAL4
        STORE 0 TO XCANTIDAD5,XPRECIO5,XTOTAL5
        STORE 0 TO XCANTIDAD6,XPRECIO6,XTOTAL6
        STORE 0 TO XCANTIDAD7,XPRECIO7,XTOTAL7
        STORE 0 TO XCANTIDAD8,XPRECIO8,XTOTAL8
        STORE 0 TO XCANTIDAD9,XPRECIO9,XTOTAL9
        STORE 0 TO XCANTIDADA,XPRECIO10,XTOTAL10
        STORE 0 TO XCANTIDADB,XPRECIO11,XTOTAL11
        STORE 0 TO XCANTIDADC,XPRECIO12,XTOTAL12
        STORE 0 TO XCANTIDADD,XPRECIO13,XTOTAL13

        STORE SPACE(40) TO XARTICULO1,XARTICULO2,XARTICULO3,XARTICULO4,XARTICULO5
        STORE SPACE(40) TO XARTICULO6,XARTICULO7,XARTICULO8,XARTICULO9,XARTICULOA
        STORE SPACE(40) TO XARTICULOB,XARTICULOC,XARTICULOD
                        
        @3,65 GET XRUT PICT "99.999.999-X"
        @2,14 GET XDIA PICT "99"
        @2,20 GET XMES PICT "AAAAAAAAAA"
        @2,35 GET XANNO PICT "9999"
        @3,14 GET XNOMBRE PICT "@X"
        @4,14 GET XDIRECCION PICT "@X"
        @4,65 GET XCOMUNA PICT "@X"
        @5,16 GET XOCOMPRA PICT "@X"
        @5,37 GET XGIRO PICT "@X"
        @5,65 GET XFONO PICT "@X"
        @6,25 GET XGD PICT "@X"
        @6,65 GET XCV PICT "@X"

        @8,3 GET XCANTIDAD1 PICT "9,999,999"
        @8,14 GET XARTICULO1 PICT  "@X"
        @8,57 GET XPRECIO1 PICT "99,999.99"
        @8,68 GET XTOTAL1 PICT   "9,999,999"
        @9,3 GET XCANTIDAD2 PICT "9,999,999"
        @9,14 GET XARTICULO2 PICT  "@X"
        @9,57 GET XPRECIO2 PICT "99,999.99"
        @9,68 GET XTOTAL2 PICT   "9,999,999"
        @10,3 GET XCANTIDAD3 PICT "9,999,999"
        @10,14 GET XARTICULO3 PICT  "@X"
        @10,57 GET XPRECIO3 PICT "99,999.99"
        @10,68 GET XTOTAL3 PICT   "9,999,999"
        @11,3 GET XCANTIDAD4 PICT "9,999,999"
        @11,14 GET XARTICULO4 PICT  "@X"
        @11,57 GET XPRECIO4 PICT "99,999.99"
        @11,68 GET XTOTAL4 PICT   "9,999,999"
        @12,3 GET XCANTIDAD5 PICT "9,999,999"
        @12,14 GET XARTICULO5 PICT  "@X"
        @12,57 GET XPRECIO5 PICT "99,999.99"
        @12,68 GET XTOTAL5 PICT   "9,999,999"
        @13,3 GET XCANTIDAD6 PICT "9,999,999"
        @13,14 GET XARTICULO6 PICT  "@X"
        @13,57 GET XPRECIO6 PICT "99,999.99"
        @13,68 GET XTOTAL6 PICT   "9,999,999"
        @14,3 GET XCANTIDAD7 PICT "9,999,999"
        @14,14 GET XARTICULO7 PICT  "@X"
        @14,57 GET XPRECIO7 PICT "99,999.99"
        @14,68 GET XTOTAL7 PICT   "9,999,999"
        @15,3 GET XCANTIDAD8 PICT "9,999,999"
        @15,14 GET XARTICULO8 PICT  "@X"
        @15,57 GET XPRECIO8 PICT "99,999.99"
        @15,68 GET XTOTAL8 PICT   "9,999,999"
        @16,3 GET XCANTIDAD9 PICT "9,999,999"
        @16,14 GET XARTICULO9 PICT  "@X"
        @16,57 GET XPRECIO9 PICT "99,999.99"
        @16,68 GET XTOTAL9 PICT   "9,999,999"
        @17,3 GET XCANTIDADA PICT "9,999,999"
        @17,14 GET XARTICULOA PICT  "@X"
        @17,57 GET XPRECIO10 PICT "99,999.99"
        @17,68 GET XTOTAL10 PICT   "9,999,999"
        @18,3 GET XCANTIDADB PICT "9,999,999"
        @18,14 GET XARTICULOB PICT  "@X"
        @18,57 GET XPRECIO11 PICT "99,999.99"
        @18,68 GET XTOTAL11 PICT   "9,999,999"
        @19,3 GET XCANTIDADC PICT "9,999,999"
        @19,14 GET XARTICULOC PICT  "@X"
        @19,57 GET XPRECIO12 PICT "99,999.99"
        @19,68 GET XTOTAL12 PICT   "9,999,999"
        @20,3 GET XCANTIDADD PICT "9,999,999"
        @20,14 GET XARTICULOD PICT  "@X"
        @20,57 GET XPRECIO13 PICT "99,999.99"
        @20,68 GET XTOTAL13 PICT   "9,999,999"
        @22,7 GET XSON1 PICT "@X"
        @23,7 GET XSON2 PICT "@X"

        @22,67 GET XNETO  PICT    "99,999,999"
        @23,67 GET XIVA   PICT    "99,999,999"
        @24,67 GET XTOTALFAC PICT "99,999,999"
        READ
                IF LASTKEY()=27 .AND. XCANTIDAD1=0
                        EXIT
                ENDIF
                ************** SE IMPRIME FACTURA
                @24,20 SAY "                        "
                OPCIONPRINT=SPACE(1)
                DO WHILE .T.
                        TONE(300,1)
                        @24,5 SAY "          SE IMPRIMIRA FACTURA, CONTINUAMOS S/N: " GET OPCIONPRINT PICT "A"
                        READ
                        IF OPCIONPRINT="S" .OR. OPCIONPRINT="N"
                                EXIT
                        ENDIF
                ENDDO
                @24,5 SAY "                                        "
                IF OPCIONPRINT="S"
                        TONE(300,1)
                        SET COLOR TO W/B
                        @10,5 CLEAR TO 15,45
                        @11,6 SAY "ENCIENDA IMPRESORA Y COLOQUE FACTURA"
                        @12,6 SAY "LUEGO PRESION UNA TECLA PARA SEGUIR "
                        INKEY(0)
                        @13,6 SAY "IMPRIMIENDO ....................... "
                        SET COLOR TO

                        IF ISPRINTER()

                                SET DEVICE TO PRINTER
                                SET PRINTER ON
                                SET CONSOLE OFF
                                SETPRC()
                                @10,14 SAY XDIA PICT "99"
                                @10,21 SAY XMES PICT "AAAAAAAAA"
                                @10,34 SAY XANNO PICT "9999"
                                @12,14 SAY XNOMBRE
                                @12,64 SAY XRUT
                                @14,14 SAY XDIRECCION
                                @14,64 SAY XCOMUNA
                                @16,17 SAY XOCOMPRA
                                @16,38 SAY XGIRO
                                @16,64 SAY XFONO
                                @18,20 SAY XGD
                                @18,64 SAY XCV           
        IF XCANTIDAD1>0
        @24,5 SAY XCANTIDAD1 PICT "9999999"
        @24,13 SAY XARTICULO1 PICT  "@X"
        @24,61 SAY XPRECIO1 PICT "99999.99"
        @24,70 SAY XTOTAL1 PICT   "9,999,999"
        ENDIF
        IF XCANTIDAD2>0
        @26,5 SAY XCANTIDAD2 PICT "9999999"
        @26,13 SAY XARTICULO2 PICT  "@X"
        @26,61 SAY XPRECIO2 PICT "99999.99"
        @26,70 SAY XTOTAL2 PICT   "9,999,999"
        ENDIF
        IF XCANTIDAD3>0
        @28,5 SAY XCANTIDAD3 PICT "9999999"
        @28,13 SAY XARTICULO3 PICT  "@X"
        @28,61 SAY XPRECIO3 PICT "99999.99"
        @28,70 SAY XTOTAL3 PICT   "9,999,999"
        ENDIF
        IF XCANTIDAD4>0
        @30,5 SAY XCANTIDAD4 PICT "9999999"
        @30,13 SAY XARTICULO4 PICT  "@X"
        @30,61 SAY XPRECIO4 PICT "99999.99"
        @30,70 SAY XTOTAL4 PICT   "9,999,999"
        ENDIF
        IF XCANTIDAD5>0
        @32,5 SAY XCANTIDAD5 PICT "9999999"
        @32,13 SAY XARTICULO5 PICT  "@X"
        @32,61 SAY XPRECIO5 PICT "99999.99"
        @32,70 SAY XTOTAL5 PICT   "9,999,999"
        ENDIF
        IF XCANTIDAD6>0
        @34,5 SAY XCANTIDAD6 PICT "9999999"
        @34,13 SAY XARTICULO6 PICT  "@X"
        @34,61 SAY XPRECIO6 PICT "99999.99"
        @34,70 SAY XTOTAL6 PICT   "9,999,999"
        ENDIF
        IF XCANTIDAD7>0
        @36,5 SAY XCANTIDAD7 PICT "9999999"
        @36,13 SAY XARTICULO7 PICT  "@X"
        @36,61 SAY XPRECIO7 PICT "99999.99"
        @36,70 SAY XTOTAL7 PICT   "9,999,999"
        ENDIF
        IF XCANTIDAD8>0
        @38,5 SAY XCANTIDAD8 PICT "9999999"
        @38,13 SAY XARTICULO8 PICT  "@X"
        @38,61 SAY XPRECIO8 PICT "99999.99"
        @38,70 SAY XTOTAL8 PICT   "9,999,999"
        ENDIF
        IF XCANTIDAD9>0
        @40,5 SAY XCANTIDAD9 PICT "9999999"
        @40,13 SAY XARTICULO9 PICT  "@X"
        @40,61 SAY XPRECIO9 PICT "99999.99"
        @40,70 SAY XTOTAL9 PICT   "9,999,999"
        ENDIF
        IF XCANTIDADA>0
        @42,5 SAY XCANTIDADA PICT "9999999"
        @42,13 SAY XARTICULOA PICT  "@X"
        @42,61 SAY XPRECIO10 PICT "99999.99"
        @42,70 SAY XTOTAL10 PICT   "9,999,999"
        ENDIF
        IF XCANTIDADB>0
        @44,5 SAY XCANTIDADB PICT "9999999"
        @44,13 SAY XARTICULOB PICT  "@X"
        @44,61 SAY XPRECIO11 PICT "99999.99"
        @44,70 SAY XTOTAL11 PICT   "9,999,999"
        ENDIF
        IF XCANTIDADC>0
        @46,5 SAY XCANTIDADC PICT "9999999"
        @46,13 SAY XARTICULOC PICT  "@X"
        @46,61 SAY XPRECIO12 PICT "99999.99"
        @46,70 SAY XTOTAL12 PICT   "9,999,999"
        ENDIF
        IF XCANTIDADD>0
        @48,5 SAY XCANTIDADD PICT "9999999"
        @48,13 SAY XARTICULOD PICT  "@X"
        @48,61 SAY XPRECIO13 PICT "99999.99"
        @48,70 SAY XTOTAL13 PICT   "9,999,999"
        ENDIF


                                @51,12 SAY XSON1
                                @51,70 SAY XNETO PICT "99,999,999"
                                @52,12 SAY XSON2
                                @53,63 SAY "19"
                                @53,70 SAY XIVA PICT "99,999,999"   
                                @55,70 SAY XTOTALFAC PICT "99,999,999" 
                                @56,0 SAY " "
                                SET DEVICE TO SCREEN
                                SET PRINTER OFF
                                SET CONSOLE ON                     
                        ELSE
                                SET COLOR TO W/B
                                @15,5 CLEAR TO 20,45
                                @16,6 SAY "E R R O R  !!!!!!!!                 "
                                @17,6 SAY "NO SE DETECTO NINGUNA IMPRESORA.    "
                                INKEY(0)
                                SET COLOR TO
                        ENDIF
                        DO TECLA WITH "FACTURA EMITIDA SATISFACTORIAMENTE"
                ENDIF
ENDDO
RETURN

