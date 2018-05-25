       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WEBINPUT ASSIGN TO KEYBOARD
           FILE STATUS IS IN-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD WEBINPUT.
          01 CHUNK-OF-POST     PIC X(1024).

       WORKING-STORAGE SECTION.
       01 IN-STATUS            PIC 9999.
       01 NEWLINE              PIC X     VALUE X'0A'.

       01 POST-PARAMETER.
          05 PARAMETER-NAME    PIC X(20).
          05 PARAMETER-VALUE   PIC X(20).

       01  TEMP-FELDER.
           05  END-NUMBER         PIC 9(20).
           05  CURRENT-NUMBER     PIC 9(20).
           05  CURRENT-RESULT     PIC X(20).
           05  REMAINDER-BY-3     PIC 9(10).
       		 05  REMAINDER-BY-5     PIC 9(10).
           05  DIV-RESULT         PIC 9(10).
       PROCEDURE DIVISION.
           PERFORM U01-PRINT-HEADER

           PERFORM U02-PARSE-INPUT

           PERFORM VARYING CURRENT-NUMBER FROM 1 BY 1
            UNTIL CURRENT-NUMBER >= END-NUMBER
              PERFORM 1000-PROCESS-NUMBER
              DISPLAY CURRENT-RESULT
              DISPLAY "<br>"
           END-PERFORM

           GOBACK
          .

       1000-PROCESS-NUMBER SECTION.

           IF CURRENT-NUMBER = 5 THEN
             MOVE 'BUZZ' TO CURRENT-RESULT
           ELSE
             MOVE 'FIZZ' TO CURRENT-RESULT
           END-IF

          .
       1000Z.
           EXIT.

       U01-PRINT-HEADER SECTION.
           DISPLAY "CONTENT-TYPE: TEXT/HTML"
                    NEWLINE
          .
       U02-PARSE-INPUT SECTION.
           OPEN INPUT WEBINPUT
           IF IN-STATUS < 10 THEN
            READ WEBINPUT END-READ
            IF IN-STATUS > 9 THEN
              MOVE SPACES TO CHUNK-OF-POST
            END-IF
           END-IF
           CLOSE WEBINPUT

           UNSTRING CHUNK-OF-POST
            DELIMITED BY "="
            INTO PARAMETER-NAME
            PARAMETER-VALUE

           UNSTRING PARAMETER-VALUE
            DELIMITED BY SPACE
            INTO END-NUMBER

           IF END-NUMBER IS NUMERIC THEN
            PERFORM 1000-PROCESS-NUMBER
           ELSE
            DISPLAY "Ungültige Eingabe!"
           END-IF
          .
       END PROGRAM FIZZBUZZ.
