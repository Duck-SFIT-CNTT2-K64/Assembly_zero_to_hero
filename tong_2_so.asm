.model small
.stack 100h
.data
    a db 'Nhap a: $'
    b db 10, 13, 'Nhap b: $'
    output db 10, 13, 'tong cua a + b = $'
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    ;in dong nhap a
    mov ah, 9
    lea dx, a
    int 21h
    
    ;Nhap a
    mov ah, 1
    int 21h
    sub al, 48 ;chuyen tu ASHII sang so
    mov bl, al ;luu gia tri a vao bl
    
    ;in dong nhap b
    mov ah, 9
    lea dx, b
    int 21h
    
    ;nhap b
    mov ah, 1
    int 21h
    sub al, 48
    
    ; tinh tong
    add al, bl
    add al, 48 ;khi xuat thi cong them 48
    mov bl, al
    
    ;in ra dong tong
    mov ah, 9
    lea dx, output
    int 21h
    
    ;in ra tong
    mov ah, 2
    mov dl, bl
    int 21h
    
    
    mov ah, 4Ch
    int 21h
    
    main endp
end main