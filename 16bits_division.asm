        org 0x7c00
        bits 16

        mov ax, 0
        mov ds, ax
        cli

        mov dx, 0
        mov ax, 4567 ; number that will be divided
        mov bx, ax

        mov cl, 4 ; counter with the character qty of the number
        mov ch, cl
        call showInt

        hlt

showInt:
        loop:
            or cl, cl
            jz printInt

            mov ax, bx ; divide and put the quotient into bx
            mov bx, 10
            cwd
            div bx
            push dx ; mod
            mov bx, ax
    
            dec cl
            jmp loop

printInt: mov cl, ch
        loop2:
            or cl, cl
            jz halt
            pop dx
            mov ax, dx ; print mod
            add al, 48
            mov ah, 0x0e
            int 10h
            dec cl
            jmp loop2

halt: ret

        times 510 - ($ - $$) db 0
        db 0x55
        db 0xaa