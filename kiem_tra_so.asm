.model small
.stack 100h
.data
    msgin db 10, 13, 'Nhap so: $'
    msgout db 10, 13, 'So vua nhap: $'
.code
    main proc
    mov ax, @data
    mov ds, ax

nhaplai:    
    mov ah, 9
    lea dx, msgin
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48
    
    cmp al, 0
    jl nhaplai
    cmp al, 9
    jle xuat
    
    jmp nhaplai
    
xuat:
    mov bl, al
    mov ah, 9
    lea dx, msgout
    int 21h
    
    mov ah, 2
    add bl, 48
    mov dl, bl
    int 21h    
    
    mov ah, 4Ch
    int 21h    
    main endp
end main