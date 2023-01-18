.model small  
.data
num db 5,1,3,1,2,3,7
.code

mov ax,@data
mov ds,ax 

call Prime

Prime proc
    ; loop
    mov cl,7
    mov si,0
    
    L1:
       mov bl,2
       
       L2:
          cmp [num+si],2
          jl Exit
          
       
          cmp bl,[num+si]
          je Exit
          
          ;copy value of array
          mov al,[num+si]
          mov ah,0
          
          div bl
          
          cmp ah,0
          je E
          
          inc bl
       
       
       JMP L2
       
       
       Exit:
          ; print statement
          mov dl,[num+si] 
          add dl,30h
          mov ah,02
          int 21h 
          
          
       E:
       
        inc si
    
    Loop L1
    
Endpt
    
    
    
       E:
        ; print prime number
        mov dl,[nums+si]
        add dl,30h
        mov ah,02
        int 21h
        
        ; print space
        mov dx,032
        mov ah,02
        int 21h
        
       Exit:
        ; increment index 
        inc si
        
    loop L1
; terminate macro    
ENDM


; call macro for nums
CheckPrime nums