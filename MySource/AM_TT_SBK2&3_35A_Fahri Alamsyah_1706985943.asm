;Program dengan bahasa assembly menggunakan emu8086
;mengubah huruf kecil menjadi huruf kapital dan huruf kapital menjadi huruf kecil  
;dalam hal ini program harus dijalankan dua kali atau direload untuk mengetahui perbedaannyame
;FAHRI ALAMSYAH    

NAME "KONVERSI HURUF"
ORG 100H 
.DATA  
DATA1:    db 13,10,'Masukkan sebuah huruf kecil atau huruf besar.',13,10,'$'
DATA2:    db 13,10,'Huruf tersebut diubah menjadi huruf kecil atau huruf besar: ',13,10,'$'
DATA3:    db 13,10,'Kesalahan, yang Anda masukkan bukan huruf kecil atau huruf besar.',13,10,'$'
DATA4:    db 13,10,'Program selesai, kembali ke sistem operasi.',13,10,'$' 
.CODE
START:
MOV AH, 9   ;menyalin 9 desimal ke dalam AH low byte dalam hal ini merupakan akumulator berukuran 8 bit 
MOV DX, DATA1 ; menyalin isi word lokasi memory segmen data1 ke dalam DX yang bertugas menyimpan hasil berukuran 16 bit
INT 21H ;berfungsi sebagai DOS dalam hal ini bisa menjadi input maupun output (FullScreen)
MOV AH, 1; menyalin 1 desimal ke dalam AH low byte dalam hal ini merupakan akumulator berukuran 8 bit
INT 21H ;berfungsi sebagai DOS dalam hal ini bisa menjadi input maupun output (FullScreen)

CMP AL, 60H ; membandingkan bilangan 60H dan register AL yang memiliki operasi AL-60H yang dalam hal ini bentuk pengurangan
            ; yang hanya mengurangi dan mengubah bit flag flagnya 
JL BESAR    ; dalam hal ini adalah conditional jump , jump bila kurang dari  S<>0
CMP AL, 7AH ; membandingkan bilangan 60H dan register AL yang memiliki operasi AL-60H yang dalam hal ini bentuk pengurangan
            ; yang hanya mengurangi dan mengubah bit flag flagnya 
JG KECIL    ; dalam hal ini adalah conditional jump , jump bila lebih besar dari Z=0 atau S=0

KECIL: 
SUB AL, 20H ;
PUSH AX     ; menyalin isi AX ke stack dimana sebelumnya terdapat alamat segmennya dan offsetnya
MOV AH, 9   ; menyalin 9 desimal ke dalam AH low byte dalam hal ini merupakan akumulator berukuran 8 bit 
MOV DX, DATA2  ; menyalin isi word lokasi memory segmen data2 ke dalam DX yang bertugas menyimpan hasil berukuran 16 bit
INT 21H    ; berfungsi sebagai DOS dalam hal ini bisa menjadi input maupun output (FullScreen)
POP DX     ; menghapus data dari stack dan menempatkannya pada register 16 bit,register segmen,atau lokasi memori l6 bit
MOV AH, 2  ; menyalin 2 desimal ke dalam AH low byte dalam hal ini merupakan akumulator berukuran 8 bit 
INT 21H    ; berfungsi sebagai DOS dalam hal ini bisa menjadi input maupun output (FullScreen)
JMP KELUAR ; meloncati bagian program dan masuk ke cabang manapun di memori untuk instruksi selanjutnya

BESAR: 
ADD AL, 20H   ; AL = AL + Bilangan 20H
PUSH AX       ; menyalin isi AX ke stack dimana sebelumnya terdapat alamat segmennya dan offsetnya
MOV AH, 9     ; menyalin 9 desimal ke dalam AH low byte dalam hal ini merupakan akumulator berukuran 8 bit
MOV DX, DATA2 ; menyalin isi word lokasi memory segmen data2 ke dalam DX yang bertugas menyimpan hasil berukuran 16 bit
INT 21H       ; berfungsi sebagai DOS dalam hal ini bisa menjadi input maupun output (FullScreen)
POP DX        ; menghapus data dari stack dan menempatkannya pada register 16 bit,register segmen,atau lokasi memori l6 bit
MOV AH, 2     ; menyalin 2 desimal ke dalam AH low byte dalam hal ini merupakan akumulator berukuran 8 bit 
INT 21H       ; berfungsi sebagai DOS dalam hal ini bisa menjadi input maupun output (FullScreen)
JMP KELUAR    ; meloncati bagian program dan masuk ke cabang manapun di memori untuk instruksi selanjutnya


SALAH:
MOV AH, 9    ;menyalin 9 desimal ke dalam AH low byte dalam hal ini merupakan akumulator berukuran 8 bit
MOV DX, DATA3;menyalin isi word lokasi memory segmen data3 ke dalam DX yang bertugas menyimpan hasil berukuran 16 bit
INT 21H      ;berfungsi sebagai DOS dalam hal ini bisa menjadi input maupun output (FullScreen)
JMP KELUAR   ;meloncati bagian program dan masuk ke cabang manapun di memori untuk instruksi selanjutnya


KELUAR:
MOV AH, 9     ;menyalin 9 desimal ke dalam AH low byte dalam hal ini merupakan akumulator berukuran 8 bit
MOV DX, DATA4 ;menyalin isi word lokasi memory segmen data4 ke dalam DX yang bertugas menyimpan hasil berukuran 16 bit
INT 21H       ;berfungsi sebagai DOS dalam hal ini bisa menjadi input maupun output (FullScreen)
MOV AH, 4CH   ;merupakan pengalamatan immediate yang datanya konstan sedangkan data yang dipindahkan dari register adalah data berubah 
INT 21H       ;berfungsi sebagai DOS dalam hal ini bisa menjadi input maupun output (FullScreen)
 END          ;mengakhiri program