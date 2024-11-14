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
    
    ; In thông báo nh?p n
    mov ah, 9
    lea dx, msgin
    int 21h
    
    ; Nh?p giá tr? n
    mov ah, 1
    int 21h
    sub al, 48                 ; Chuy?n ký t? sang giá tr? s?
    mov ah, 0
    mov cx, ax                 ; Luu n vào CX d? l?p
    
    mov ax, 0                  ; AX s? luu t?ng
    mov bx, 1
tinh:
    add ax, bx
    inc bx
    loop tinh                  ; L?p d? tính t?ng t? 1 d?n n
    
    mov tong, ax               ; Luu k?t qu? vào bi?n tong
    
    ; In thông báo k?t qu?
    mov ah, 9
    lea dx, msgout
    int 21h
    
    ; In k?t qu? trong tong
    mov ax, tong
    call print_number          ; G?i hàm in s?
    
    mov ah, 4Ch                ; Thoát chuong trình
    int 21h
    main endp

; Hàm in s? nguyên t? AX ra màn hình
print_number proc
    mov cx, 10                 ; H? th?p phân
    mov di, 0                  ; Ch? s? d? luu ch? s?
    mov si, 0                  ; Ð?m ch? s?

convert_loop:
    mov dx, 0
    div cx                     ; AX = AX / 10, DX = AX % 10
    add dl, 48                 ; Chuy?n giá tr? s? thành ký t? ASCII
    push dx                    ; Ð?y ký t? vào stack
    inc si                     ; Tang b? d?m ch? s?
    
    cmp ax, 0
    jne convert_loop           ; Ti?p t?c n?u AX chua b?ng 0

print_digits:
    pop dx                     ; L?y ký t? t? stack
    mov ah, 2
    mov dl, dx
    int 21h                    ; In ký t?
    dec si                     ; Gi?m b? d?m ch? s?
    jnz print_digits           ; In ti?p n?u còn ký t?

    ret
print_number endp
end main
