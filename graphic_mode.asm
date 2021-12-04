        org 0x7c00
        bits 16

        mov ax, 0
        mov ds, ax
        cli

        mov al, 0x13 ; 0x13 is 256 color (320x200) VGA mode
        int 0x10

        mov ax, 0xA000 ; 0xA000 => video memory segment
        mov es, ax

        mov cx, 64000 ; the 64000 bytes for colors will be filled with red
        mov di, 0

loop:
        mov [es:di], byte 39
        inc di
        dec cx
        jnz loop

        hlt

        times 510 - ($-$$) db 0
        dw 0xaa55
