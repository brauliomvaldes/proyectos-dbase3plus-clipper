ENTEROV=INT(XTOTALFAC) 

N = ""
N1 = "UN" 
N2 = "DOS" 
N3 = "TRES" 
N4 = "CUATRO" 
N5 = "CINCO" 
N6 = "SEIS" 
N7 = "SIETE" 
N8 = "OCHO" 
N9 = "NUEVE" 
N10 = "DIEZ" 
N11 = "ONCE" 
N12 = "DOCE" 
N13 = "TRECE" 
N14 = "CATORCE" 
N15 = "QUINCE" 
N16 = "DIECISEIS" 
N17 = "DIECISIETE" 
N18 = "DIECIOCHO" 
N19 = "DIECINUEVE" 
N20 = "VEINTE" 
N30 = "TREINTA" 
N40 = "CUARENTA" 
N50 = "CINCUENTA" 
N60 = "SESENTA" 
N70 = "SETENTA" 
N80 = "OCHENTA" 
N90 = "NOVENTA" 
IF ENTEROV <> 100 
      N100 = "CIENTO" 
ENDIF 
IF ENTEROV = 100 
      N100="CIEN" 
ENDIF 
N200 = "DOSCIENTOS"
N300 = "TRESCIENTOS" 
N400 = "CUATROCIENTOS" 
N500 = "QUINIENTOS" 
N600 = "SEISCIENTOS" 
N700 = "SETECIENTOS" 
N800 = "OCHOCIENTOS" 
N900 = "NOVECIENTOS" 
CONTADOR = 1 
INICIO = 1 
CADENA = STR(ENTEROV,9)


NUMP = "" 
DO WHILE CONTADOR < 4 
      SUBCADENA = SUBSTR(CADENA,INICIO,3) 
      CENTENA = SUBSTR(SUBCADENA,1,1)+"00" 
      DECENA = SUBSTR(SUBCADENA,2,2) 
      UNIDAD = SUBSTR(SUBCADENA,3,1) 
      IF VAL(SUBCADENA) > 99 
            NUMP = NUMP + N&CENTENA + " " 
      ENDIF (SUBCADENA > 99) 
      T = VAL(DECENA) 
      IF T > 0 
            DO CASE 
                  CASE (INT(T/10.0) = T/10.0) .OR. (T > 9 .AND. T <20) 
                  NUMP = NUMP + N&DECENA 
            CASE T > 9 .AND. (INT(T/10.0) # T/10.0) 
                  DECENA = SUBSTR(DECENA,1,1) + "0" 
                  IF DECENA # "20" 
                        NUMP = NUMP + N&DECENA + " Y " + N&UNIDAD 
                  ELSE 
                        NUMP = NUMP + "VEINTI" +N&UNIDAD 
                  ENDIF 
            CASE T < 10 
                  NUMP = NUMP + N&UNIDAD 
            ENDCASE 
      ENDIF (T > 0) 
      IF ENTEROV > 999999 .AND. CONTADOR = 1 
            NUMP = NUMP + " MILLONES " 
      ENDIF                
      IF NUMP = "UNO MILLONES " 
            NUMP = "UN MILLON " 
      ENDIF 
      IF ENTEROV > 999 .AND. CONTADOR = 2 .AND. VAL(SUBCADENA) > 0 
            NUMP = NUMP + " MIL " 
      ENDIF
      IF NUMP = "UNO "
            NUMP = "UN "
      ENDIF
      IF NUMP = "UN MILLONES "
            NUMP = "UN MILLON "
      ENDIF
      IF NUMP = "UNO MIL " 
            NUMP = "UN MIL " 
      ENDIF 
      INICIO = CONTADOR * 3 + 1 
      CONTADOR = CONTADOR + 1 
ENDDO 
NUMP=NUMP+" PESOS.-"
LENNUMP=LEN(NUMP)
LUGAR=50
IF LENNUMP>50
        IF SUBSTR(NUMP,50,1)<>" "
                DO WHILE .T.
                        LUGAR=LUGAR-1
                        IF SUBSTR(NUMP,LUGAR,1)=" "
                                EXIT
                        ENDIF
                ENDDO
        ENDIF
        XSON1=SUBSTR(NUMP,1,LUGAR)
        XSON2=SUBSTR(NUMP,LUGAR+1,(LENNUMP-LUGAR))
ELSE
        XSON1=NUMP
ENDIF
RETURN
