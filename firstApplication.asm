;Donat Salihu


; a program that demonstrates arithemtic operations(ADD, SUBSTRACT, MULTIPLY, DIVIDE)
; Uses data structure(STACK) to reverse a given String
; performs a very simple string manipulation.      
; performs logical(AND,OR,XOR) operations also a SHL instruction that shifts a bit in the register to the left. The leftmost bit  being shifted is stored in the Carry Flag(CF)

.model small           ; assembler directive to allocate memory
.stack 100h


.data                ; data segment
                     
  
       
        a db 04h       ; a = 4
        b db 02h       ; b = 2               
        string db 'PolymathLabs'  
         
        
.code        
begin:
          ; code segment
        mov ax, @data  ; initialize ds register
        mov ds, ax
        
        ;arithmetic operations 
        ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        mov es, ax
 
        
        mov ax, 0h     ; clearing contents of ax, bx and cx 
        mov bx, 0h
        mov cx, 0h

        mov al, a      ; move a to al
        mov bl, b      ; move b to bl
        mov cl, b      ; move b to cl
             
             
        
             
        add al, bl     ; add al and bl and store the sum in al
        sub al, bl     ; subtract bl from al and store result in al
        mul cl         ; multiply al with cl and store the product in al
        div cl         ; divide al by cl and store quotient in al
         
        
        ;SHL instruction
        ; from 00000001b = 1 decimal, we are going to shift the value for count 2, which means 00000100b  which is 4 is decimal.
        
        mov ax, 1
        shl ax, 2
        
        
        
       
        ;AND Instruction
        ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        mov ah, 00000001b
        mov bh, 00000101b
        
        and ah, bh
        
        mov ah,0
        mov bh, 0h
        
        ;OR Instruction
        
        mov ah, 00001110b
        mov bh, 01010111b
        
        or ah, bh
        
        mov ah, 0h
        mov bh, 0h
        
        ;XOR Instruction
        
        mov ah, 01010101b
        mov bh, 01000111b
        
        xor ah, bh
        
        mov ah,0
        mov bh, 0h
        
        ;Simple String manipulations
        ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         CLD ;cleans the direction flag
        
        mov si, offset string
        lodsb
        movsb
        stosb     
        
        
         jmp location
        
        text: db "Donati" , 80h, 0Ah, 24h
        
        location: mov dx, text
        mov ah, 09h
        int 21h
        
        mov ah, 0
        int 21h
        
         
        ;Reverse String                                 
        ;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        mov si, offset string  ;move the string in s1
        
        mov cx,  12            ;the length of the string is 12
        
        
         loopx:
             mov bx,[si]       ;the proccessor fetches the values in memory[si]
             push bx           ; pushes the element it fetched in a stack
             inc si            ; increments s1, gets the next character
             loop loopx  
             
        mov cx, 12
       
        loopy:
              pop dx            ;pop the element out of the stack
              mov ah, 02h       ;prints char
              int 21h
              loop loopy   
       
 
        
        
        end            ; end directive