;-------------------------------------------------------------------------
                                                                          
; PROGRAM TITLE : HELLO
; AUTHOR        : FAHRI ALAMSYAH 
; DESCRIPTION   : HELLO WORLD!
; VERSION       : 1

;-------------------------------------------------------------------------

    .MODEL SMALL        ; 64 MAX PROGRAM SIZE 
    
;-------------------------------------------------------------------------

    .STACK 100H         ; RESERVE 100H <256D> LOCATION STACK 
    
;-------------------------------------------------------------------------

    .DATA               ; define the beginning of DATA
    
        MSG DB 'HELLO WORLD!$'
        
;-------------------------------------------------------------------------

    .CODE               ; define the beggining of CODE 
    .STARTUP            ; start of instruction & load segment registers
    
    MOV AH,9H
    MOV DX, OFFSET MSG
    INT 21H 
    
    MOV BX,AX
    MOV AH,[3H]
    
    

;-------------------------------------------------------------------------
    .EXIT               
END                     ; where program ends

 