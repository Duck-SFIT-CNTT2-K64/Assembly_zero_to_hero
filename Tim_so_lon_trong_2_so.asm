.model small
.stack 100h
.data
    so1 db 'Nhap so thu nhat: $'
    so2 db 10, 13, 'Nhap so thu hai: $'
    kqua db 10, 13, 'So lon hon: $'
    bang db 10, 13, 'Hai so bang nhau$'
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, so1
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48
    mov bx, ax
    
    mov ah, 9
    lea dx, so2
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48
    
    
    cmp al, bl
    je bangnhau
    jg lon_hon
    mov dl, bl
    jmp xuat
    
lon_hon:
    mov dl, al
    
bangnhau:
    mov ah, 9
    lea dx, bang
    int 21h
    jmp thoat    
    
xuat:
    mov cl, dl
    mov ah, 9
    lea dx, kqua
    int 21h
    
    mov ah, 2
    add cl, 48
    mov dl, cl
    int 21h
            
thoat:    
    mov ah, 4Ch
    int 21h    
    main endp
end main