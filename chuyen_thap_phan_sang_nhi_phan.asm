.model small
.stack 100h
.data
    msgin db 'Nhap so thap phan: $'
    msgout db 10, 13, 'So nhi phan cua no: $'
    kqua db ?
    arrkq db 16 dup(?)
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msgin
    int 21h
    
    ;input
input:    
    mov ah, 1
    int 21h
    cmp al, 13
    je end_input
    
    sub al, 48
    mov cl, al
    
    mov ax, 10
    mul bx
    mov bx, ax
    
    add bl, cl
    
    jmp input
    
end_input:
    mov ax, bx    
    mov cx, 0
    
convert:
    mov dx, 0
    mov bx, 2
    div bx
    
    push dx
    inc cx
    
    cmp ax, 0
    jne convert
    
    
    mov ah, 9
    lea dx, msgout
    int 21h
    
printf:
    pop dx
    add dl, 48
    mov ah, 2
    int 21h
    
    loop printf    
    
    mov ah, 4Ch
    int 21h    
    main endp
end main