.model small
.data  

msg1 db "ABCDE"
msg2 db "ABCDE"
msg3 db "Result: $"  
.code


mov ax, @data
mov ds, ax 

mov si,0

mov cl,5

mov bl,0

L1:
    mov al,[msg1+si]
    
    cmp al,[msg2+si]
    jne NS
    jmp E
    
    NS:
        inc bl
    
    
    E:
        inc si
    
       

Loop L1

; message
lea dx,msg3
mov ah,09
int 21h

; Hamming Distance
mov dl,bl
add dl,30h
mov ah,02

int 21h