.model small
.stack 100h
.data
    a db 'Nhap 1 so: $'
    b db 10, 13, 'So vua nhap la: $'
    chan db 'CHAN$'
    le db 'LE$'
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    ; In ra dong thong bao nhap
    mov ah, 9
    lea dx, a
    int 21h

    ; Nhap so nguyen tu ban phim
    mov bx, 0       ; BX dung de luu ket qua so nguyen nhap vao

nhap:
    mov ah, 1       ; Ham 1: nhap mot ky tu
    int 21h
    cmp al, 13      ; Neu la phim Enter (ASCII 13) thi ket thuc nhap
    je kiemtra

    sub al, 48      ; Chuyen ky tu so thanh gia tri so
    mov cl, al

    ; Tinh toan BX = BX * 10 + CL (them chu so vao ket qua)
    mov ax, bx
    mov dx, 0
    mov cx, 10
    mul cx
    add ax, cl
    mov bx, ax      ; Luu ket qua vao BX

    jmp nhap        ; Quay lai nhap chu so tiep theo

kiemtra:
    ; In so vua nhap
    mov ah, 9
    lea dx, b
    int 21h
    
    ; Dua ket qua nhap duoc vao DL de in ra
    mov ax, bx
    call print_number ; Goi ham in so

    ; Kiem tra chan le
    mov ax, bx
    mov dx, 0
    mov cx, 2
    div cx           ; AX = BX / 2, DX = BX % 2

    cmp dx, 0        ; Neu phan du = 0 thi la chan
    je chan1

    ; In "LE"
    mov ah, 9    
    lea dx, le
    int 21h
    jmp exit

chan1:
    ; In "CHAN"
    mov ah, 9    
    lea dx, chan
    int 21h

exit:       
    mov ah, 4Ch
    int 21h
    main endp

; Ham in so nguyen tu BX ra man hinh
print_number proc
    mov cx, 10      ; He thap phan
    mov di, 0       ; Chi so cua chuoi so
    mov si, 0       ; Chua chuoi so dao nguoc

convert_loop:
    mov dx, 0
    div cx          ; AX = AX / 10, DX = phan du
    add dl, 48      ; Chuyen so thanh ky tu
    push dx         ; Luu ky tu vao stack
    inc si          ; Tang chi so chuoi

    cmp ax, 0
    jne convert_loop

print_digits:
    pop dx          ; Lay ky tu tu stack
    mov ah, 2
    int 21h         ; In ky tu
    dec si          ; Giam si
    jnz print_digits

    ret
print_number endp
end main
