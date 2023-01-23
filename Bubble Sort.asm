.model small
.data

arr db 1,3,2,4,5,8,6,7,1,9

.code

mov ax,@data
mov ds,ax

mov cl,10

L1:
   mov bl,9
   mov si,0
   
   L2:
      cmp bl,0
      JE Exit
      
      mov  al,arr[si]  
      cmp al,arr[si+1]
      jle E
      
      XCHG al,arr[si+1]
      mov arr[si],al
      
      E:
        dec bl
        inc si   
     
   
   
   JMP L2
   
   Exit:


Loop L1


mov cl,10
mov si,0
L3:
   mov dl,arr[si] 
   add dl,30h
   mov ah,02
   int 21h
   
   inc si

Loop L3