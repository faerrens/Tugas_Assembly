;Program dengan bahasa assembly menggunakan emu8086
;mengubah huruf kecil menjadi huruf kapital dan huruf kapital menjadi huruf kecil 
;FAHRI ALAMSYAH    

NAME "KONVERSI HURUF"
ORG 100H
START:
MOV AH, 9       
MOV DX, DATA1 
INT 21H
MOV AH, 1
INT 21H

CMP AL, 60H
JL BESAR
CMP AL, 7AH
JG KECIL

KECIL: 
SUB AL, 20H
PUSH AX
MOV AH, 9
MOV DX, DATA2
INT 21H
POP DX
MOV AH, 2
INT 21H
JMP KELUAR 

BESAR: 
ADD AL, 20H
PUSH AX
MOV AH, 9
MOV DX, DATA2
INT 21H
POP DX
MOV AH, 2
INT 21H
JMP KELUAR


SALAH:
MOV AH, 9
MOV DX, DATA3
INT 21H
JMP KELUAR

KELUAR:
MOV AH, 9
MOV DX, DATA4
INT 21H
MOV AH, 4CH
INT 21H

DATA1:    db 13,10,'Masukkan sebuah huruf kecil.',13,10,'$'
DATA2:    db 13,10,'Huruf kecil tersebut diubah menjadi: ',13,10,'$'
DATA3:    db 13,10,'Kesalahan, yang Anda masukkan bukan huruf kecil.',13,10,'$'
DATA4:    db 13,10,'Program selesai, kembali ke sistem operasi.',13,10,'$'
END
