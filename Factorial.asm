.model small  
.data

num db 3 

.code

mov ax,@data
mov ds,ax


mov al,num
mov bl,num
dec bl

L1:
   cmp al,1
   je Print
    
   cmp bl,1
   je Print
   
   mul bl  ; al *= bl
   
   dec bl 

jmp L1


Print:
    mov dl,al
    add dl,30h
    mov ah,02
    int 21h