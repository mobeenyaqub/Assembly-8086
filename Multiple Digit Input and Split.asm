.model small
.data  

msg db 0ah,0dh,"Answer: $" 
msg1 db 0ah,0dh,"Result: $"
num db ?
.code

; for three number split -> 157


mov ax, @data
mov ds, ax 

mov dl, 10  
mov bl, 0        ; clean 

input:

      mov ah, 01
      int 21h

      cmp al, 13   ; Check if user pressed ENTER KEY
      je  Exit 

      mov ah, 0  
      sub al, 30h   ; ASCII to DECIMAL

      mov cl, al
      mov al, bl 
      
      mul dl       ; multiply the previous value with 10

      add al, cl   ; previous value + new value ( after previous value is multiplyed with 10 )
      mov bl, al

      jmp input    

Exit:

; print message

lea dx,msg1
mov ah,09
int 21h

; use dl for division
mov dl,10            


; copy number to al for splitting   

mov al,bl

; reset value of ah to 0
mov ah,0

; divide al with dl
div dl

; remainder will be the last value of the number that was entered   (7)
; save the remainder somewhere
mov bl,ah

; as number is left with 2 digits only

; reset value of ah to 0
mov ah,0

; divide again
div dl

; now ah has the last value (5) and al has the firt value (1)  

; save ah to cl
mov cl,ah                          

; print in sequence

mov dl,al     ; 1
add dl, 30h   
mov ah,02 
int 21h

mov dl,cl   ;  5
add dl,30h
mov ah,02 
int 21h

mov dl,bl   ; 7
add dl,30h
mov ah,02 
int 21h

