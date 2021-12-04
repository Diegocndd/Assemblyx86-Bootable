org 0x7c00 
	bits 16
	
	mov ax, 0
	mov ds, ax
	cli
	
	mov ah, 0x00
	mov al, 0x13   ;VGA = 320x200 e 256 cores
	int 0x10
	
	mov ax, 0xA000
	mov es, ax
	
    mov dx, 1
loop:
    mov di, cx
	mov [es:di], byte(13)
    cmp dx, 321
    je ajuste_xadrez
    cont0: cmp bx, 0
           je to1
           cmp bx, 1
           je to0
           paint:  cmp bx, 1
                   je pinta_branco
                   cmp bx, 0
                   je pinta_preto
           cont1:  cmp cx, 64000
                   jne loop
                   hlt

ajuste_xadrez:
    mov dx, 1
    cmp bx, 0
    je to0
    cmp bx, 1
    je to1

to0:
    mov bx, 0
    jmp paint

to1:
    mov bx, 1
    jmp paint

pinta_branco:
    mov [es:di], byte(15)
	inc cx
    inc dx
    jmp cont1

pinta_preto:
    mov [es:di], byte(0)
	inc cx
    inc dx
    jmp cont1

    times 510 - ($ - $$) db 0
    dw 0xaa55