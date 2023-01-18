.model small

.data
t1 db 0
t2 db 1
nextterm db 0
arr db ?
msg1 db "Enter a number: $"
msg2 db 0ah,0dh,"Result: $"
fs db ?
num db ?
.code

mov ax,@data
mov ds,ax

; display message
lea dx,msg1
mov ah,09
int 21h

; take input
mov ah,01
int 21h
          
; copy value to num
mov num,al

; print message
lea dx, msg2
mov ah,09
int 21h  

; move 1 to bl
mov bl,0

; adjust num
sub num,30h

; macro
Fibonacci Macro num

    L1: 
        ; run for n times
        cmp bl,num
        je Exit
        
        ; check for <2
        cmp bl,2
        jb Print
        jmp E
        
        Print:
            ; print value
            mov dl,bl
            add dl,30h
            mov ah,02
            int 21h
            jmp N
        
        E:  
                
            ; store data
            mov al,t1
            add al,t2
            mov nextterm, al
            mov al,t2
            mov t1, al
            mov al,nextterm
            mov t2,al
            
            
            ; print value
            mov dl,nextterm
            add dl,30h
            mov ah,02
            int 21h
        N: 
        
            ; print space
            mov dl,032
            mov ah,02
            int 21h
        
        ; increment bl
        inc bl
        
        ; jump to L1
        jmp L1
           
        
    Exit:
    
EndM
    
;call macro
Fibonacci num
  