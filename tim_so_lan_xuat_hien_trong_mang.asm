.model small
.stack 100h
.data
    msgin db 'Nhap mang: $'
    so db 10, 13, 'Nhap so can dem: $'
    kqua db 10, 13, 'So lan xuat hien: $'
    arr db 100 dup(?)
    dem db 0
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    ;in thong bao
    mov ah, 9
    lea dx, msgin
    int 21h
    
    ;nhap mang
    mov bx, 0
nhaptiep:
    mov ah, 1
    int 21h
    cmp al, 13
    je nhapso
    mov arr[bx], al
    inc bx
    jmp nhaptiep
    
    ;in thong bao
nhapso:    
    mov ah, 9
    lea dx, so
    int 21h  
    ;nhap so
    mov cx, bx
    mov ah, 1
    int 21h
    mov bl, al
    
    mov si, 0
    
timso:    
    mov al, arr[si]
    cmp al, bl
    je tang
    
    inc si
    loop timso
    jmp xuat
        
tang:
    inc dem
    inc si
    jmp timso    
    
xuat:
    mov ah, 9
    lea dx, kqua
    int 21h
    
    mov ah, 2
    add dem, 48
    mov dl, dem
    int 21h    
           
    
thoat:    
    mov ah, 4Ch
    int 21h    
    main endp
end main