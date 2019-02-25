;------------------------------------------------------
; Title : Data Adressing Modes Tugas 02 
; Author : Fahri Alamsyah
; Deskripsi : Menjelaskan Macam macam Addresing Modes yang ada di 8086
;------------------------------------------------------


;Model Program
;------------------------------------------------------
.model small
.data

data1 db 10 dup (?)
data2 dw 5678h
data3 db 0,11,22,33h,44h,55h,66h,77h,88h,99h

.code
.startup

mov ax,1234h; high byte 
mov cx,5566h; awalan segmen 

mov bx,ax ;Data dan Address
mov dl,ch ;Instruksi string dan intruksi perkalian 

mov ax,data2 ; alamat offset disimpan untuk sementara awalan 
mov dx,data2 ; kemudian disimpan dari hasil perkalian string 

mov [1000h],dx ; Ketentuan wajib sebelum operasi segmen dimulai 
mov ES:[1000h],dx ; Segmen ditambah stack pointer dan data perkalian dimulai

mov dl,offset data3 ; pengalamatan baru dan inisialisasi data baru

mov al,[di] ; Data address dan offset address diletakan di memori
mov data,al ; Permulaan register dimulai dengan macam macam segmen
            ; BP (Segmen SS yang merupakan Awalan) menuju Stack 
            ; BX,DI,DAN SI(yakni 6 bit dan 16 bit) menuju data
            
mov bx,offset data3 ; segmen DS dan menyimpan Offset di data 
mov di,offset data1 ; dua instruksi dalam satu destinasi
                    ; DI dalam hal ini register serbaguna dan DS
mov cx,10      
          again:      
           mov al,[bx]       ; jenis addressing untuk no 22   
           mov [di],al       ; jenis addressing untuk no 22      
           inc di       
           inc bx       
           loop again 
           
;24. Jenis pengalamatan apakah instruksi berikut? 
;25. Tuliskan hasil kelselurukan dari blok program berikut 
mov bx,offset data1             
mov dl,5 
mov al,[bx+di] 
mov dl,1 
mov [bx+di],al   

;26. Jenis pengalamatan apakah instruksi berikut? 
;27. Tuliskan hasil kelselurukan dari blok program berikut
mov bx,offset data1          
mov al,[bx+4] 
mov data1[2],al 
;28. Jenis pengalamatan apakah instruksi berikut? 
;29. Tuliskan hasil kelselurukan dari blok program berikut 
mov bx,2 
mov dl,4 
mov al,data1[bx+di] 
mov dl,6 
mov data1[bx+di],al        
.exit 
end 
 
