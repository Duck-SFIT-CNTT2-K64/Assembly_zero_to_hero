.model small
.stack 100h
.data
    msgin db 'Nhap chuoi: $'
    msgout db 10, 13, 'chuoi dao nguoc: $'
    arr db 100 dup(?)
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msgin
    int 21h
    
    mov bx, 0
nhap:
    mov ah, 1
    int 21h
    cmp al, 13
    je xuat
    mov arr[bx], al
    inc bx
    jmp nhap
    
xuat:
    mov cx, bx
    mov ah, 9
    lea dx, msgout
    int 21h
    
nhaptiep:    
    mov ah, 2
    mov dl, arr[bx - 1]
    int 21h
    dec bx
    loop nhaptiep
        
    
    mov ah, 4Ch
    int 21h    
    main endp
end main