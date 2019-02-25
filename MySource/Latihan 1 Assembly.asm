; buat data atau variabel di data segmen 
; isi data nama dengan tulisan abcdefghij
.MODEL SMALL
.DATA   
NAMA Db 10 DUP (?)
.CODE
.STARTUP
MOV AL,'a'
MOV BX,OFFSET NAMA
MOV CX,10
AGAIN:
MOV [BX],AL
INC AL
LOOP AGAIN
.EXIT
END 