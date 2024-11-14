.model small
.stack 100h
.data
    msgin db 'Nhap mang: $'
    msgout db 10, 13, 'So lon nhat trong mang: $'
    arr db 100 dup(?)
    result db 0
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    ;thong bao mang
    mov ah, 9
    lea dx, msgin
    int 21h
    
    ;nhap mang
    mov bx, 0
nhaptiep:
    mov ah, 1
    int 21h
    cmp al, 13
    je tim
    mov arr[bx], al
    inc bx
    jmp nhaptiep

tim:    
    mov cx, bx ; length
    mov bx, 0  ; i = 0
    jmp timtiep
timtiep:
    mov al, arr[bx]
    cmp result, al
    jl gan
    
    inc bx
    loop timtiep
    jmp xuat
    
gan:
    mov result, al
    inc bx
    jmp timtiep        

xuat:
    mov ah, 9
    lea dx, msgout
    int 21h
    
    mov ah, 2
    mov dl, result
    int 21h
    
    mov ah, 4Ch
    int 21h    
    main endp
end main