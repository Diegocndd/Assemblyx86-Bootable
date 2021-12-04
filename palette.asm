
	org 0x7c00
	bits 16
	
	mov ax, 0
	mov ds, ax
	cli
	
	mov al, 0
	mov dx, 0x03C8
	out dx, al
	
	mov dx, 0x03C9
	
	mov cx, 0

    loop:
        or cx, cx
        jz fim

        mov al, 0
        out dx, al
        
        mov al, 0
        out dx, al
        
        mov al, 63
        out dx, al

        inc cx
        jmp loop

    fim:
	mov ah, 0x00
	mov al, 0x13   ;VGA = 320x200 and 256 colors
	int 0x10

    mov ax, 0xA000  
	mov es, ax
    mov di, 0
    mov [es:di], byte(1)
	
	hlt		
	
	times 510 - ($-$$) db 0
	dw 0xaa55