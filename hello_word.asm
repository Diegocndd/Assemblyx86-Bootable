        org 0x7c00 
        bits 16   

        mov ax, 0
        mov ds, ax 
        cli 

        mov si, msg 

        mov ah, 0x0e 
  
loop:   lodsb 
        cmp al, 0
        je fim 
        int 0x10 
        jmp loop

fim:    hlt

msg:    db "Hello World", 0
        times 510 - ($ - $$) db 0 
        ; $  -> end address
        ; $$ -> start address
        db 0x55
        db 0xaa
        ; 55 aa indicates that the program is bootable