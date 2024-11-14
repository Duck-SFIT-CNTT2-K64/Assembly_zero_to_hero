.model small
.stack 100h
.data
    msgin db 10, 13, 'Ki tu can kiem tra: $'
    hoa db 10, 13, 'Day la ki tu hoa: $'
    thuong db 10, 13, 'Day la ki tu thuong: $'
    
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
    
    cmp al, 'A'
    jl nhaplai
    cmp al, 'Z'
    jle xuat_hoa
    
    cmp al, 'a'
    jl nhaplai
    cmp al, 'z'
    jle xuat_thuong
    
    jmp nhaplai
    
xuat_hoa:
    mov bl, al
    mov ah, 9
    lea dx, hoa
    int 21h
    jmp xuat_ki_tu
    
xuat_thuong:
    mov bl, al
    mov ah, 9
    lea dx, thuong
    int 21h
    jmp xuat_ki_tu    
    
    
xuat_ki_tu:
    mov ah, 2
    mov dl, bl
    int 21h           
    
    mov ah, 4Ch
    int 21h    
    main endp
end main