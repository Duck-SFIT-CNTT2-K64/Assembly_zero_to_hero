.model small
.stack 100h
.data
    a db 'nhap 1 so: $'
    b db 10, 13, 'ket qua la: $'
    kq dw ?  

.code
    main proc
    mov ax, @data
    mov ds, ax
    
    ;in ra dong thong bao
    mov ah, 9
    lea dx, a
    int 21h
    
    ;nhap
    mov ah, 1
    int 21h
    sub al, 48
    
    mov cl, al
    mov ax, 1
    
    ;vong lap
lap:
    cmp cl, 0
    je xuat
    
    mul cl
    dec cl
    jnz lap
    
xuat:
    mov kq, ax  
    
    mov ah, 9
    lea dx, b
    int 21h
    
    mov ax, kq
    mov cx, 0   
    mov bx, 10  
    
convert:
    mov dx, 0
    div bx      
    push dx     
    inc cx      
    test ax, ax 
    jnz convert
    
print_digits:
    pop dx      
    add dl, 48  
    mov ah, 2
    int 21h
    loop print_digits
    
    mov ah, 4Ch
    int 21h
    
    main endp
end main