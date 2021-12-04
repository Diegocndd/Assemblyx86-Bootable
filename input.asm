        org 0x7c00
        bits 16

        mov ax, 0
        mov ds, ax
        cli

        mov si, pergunta
        call prints

        mov di, 0x7e00
        call gets

        mov si, 0x7e00
        call prints

        jmp fim

gets:   push ax
        push di
loopg:  mov ah, 0
        int 0x16
        cmp al, 13 ; byte 13 = ENTER
        je fimgs
        mov [ds:di], al
        mov ah, 0x0e
        int 0x10 
        inc di
        jmp loopg
fimgs:  mov [ds:di], byte 0 ; byte 0 to determine end of string
        pop di
        pop ax
        ret


prints:
        push si
        push ax
        mov ah, 0x0e

        loop:
                lodsb
                or al, al
                jz retorno
                int 0x10
                jmp loop

retorno:
        pop ax
        pop si
        ret 

fim:    hlt


pergunta: db "What is your name? ", 0

        times 510 - ($ - $$) db 0
        db 0x55
        db 0xaa