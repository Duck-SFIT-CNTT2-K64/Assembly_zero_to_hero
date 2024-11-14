.model small
.stack 100h
.data
    msgin db 'Nhap n: $'
    msgout db 10, 13, 'Tong tu 1 den n: $'
    tong dw ?                  ; Luu t?ng t? 1 d?n n
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    ; In th�ng b�o nh?p n
    mov ah, 9
    lea dx, msgin
    int 21h
    
    ; Nh?p gi� tr? n
    mov ah, 1
    int 21h
    sub al, 48                 ; Chuy?n k� t? sang gi� tr? s?
    mov ah, 0
    mov cx, ax                 ; Luu n v�o CX d? l?p
    
    mov ax, 0                  ; AX s? luu t?ng
    mov bx, 1
tinh:
    add ax, bx
    inc bx
    loop tinh                  ; L?p d? t�nh t?ng t? 1 d?n n
    
    mov tong, ax               ; Luu k?t qu? v�o bi?n tong
    
    ; In th�ng b�o k?t qu?
    mov ah, 9
    lea dx, msgout
    int 21h
    
    ; In k?t qu? trong tong
    mov ax, tong
    call print_number          ; G?i h�m in s?
    
    mov ah, 4Ch                ; Tho�t chuong tr�nh
    int 21h
    main endp

; H�m in s? nguy�n t? AX ra m�n h�nh
print_number proc
    mov cx, 10                 ; H? th?p ph�n
    mov di, 0                  ; Ch? s? d? luu ch? s?
    mov si, 0                  ; �?m ch? s?

convert_loop:
    mov dx, 0
    div cx                     ; AX = AX / 10, DX = AX % 10
    add dl, 48                 ; Chuy?n gi� tr? s? th�nh k� t? ASCII
    push dx                    ; �?y k� t? v�o stack
    inc si                     ; Tang b? d?m ch? s?
    
    cmp ax, 0
    jne convert_loop           ; Ti?p t?c n?u AX chua b?ng 0

print_digits:
    pop dx                     ; L?y k� t? t? stack
    mov ah, 2
    mov dl, dx
    int 21h                    ; In k� t?
    dec si                     ; Gi?m b? d?m ch? s?
    jnz print_digits           ; In ti?p n?u c�n k� t?

    ret
print_number endp
end main
