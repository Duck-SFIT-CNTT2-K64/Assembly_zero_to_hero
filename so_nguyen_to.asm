.model small
.stack 100h
.data
    a db 'Nhap 1 so: $'
    b db 10, 13, 'so vua nhap: $'
    snt db 'SO NGUYEN TO$'
    ksnt db 'KHONG PHAI SO NGUYEN TO$'
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    ; in dong thong bao nhap
    mov ah, 9
    lea dx, a
    int 21h
    
    ; Nhap 1 so
    mov ah, 1
    int 21h
    sub al, 48         ; Chuyen ASCII sang so

    ; Kiem tra n < 2
    cmp al, 2
    jb xuat            ; Neu n < 2, nhay den xuat (khong phai so nguyen to)

    ; Kiem tra cac uoc tu 2 den sqrt(n) (hoac n/2)
    mov bl, 2          ; bl = 2, bat dau tu so 2 de kiem tra

kiemtra:
    mov ah, 0          ; Dat ah = 0 truoc khi chia
    mov cx, ax         ; Sao chep ax (so n) vao cx de chia
    div bl             ; Chia n cho bl, ket qua: al = thuong, ah = phan du

    cmp ah, 0          ; Kiem tra phan du co bang 0 khong
    je xuat            ; Neu phan du = 0, nhay den xuat (khong phai so nguyen to)

    inc bl             ; Tang bl len 1 de kiem tra so ke tiep
    cmp bl, al         ; Kiem tra neu bl >= n
    jb kiemtra         ; Neu bl < n, tiep tuc kiem tra

    ; Neu khong tim thay uoc nao, la so nguyen to
    mov ah, 9
    lea dx, b
    int 21h

    lea dx, snt        ; In thong bao so nguyen to
    int 21h    
    jmp exit           ; Ket thuc chuong trinh

xuat:
    mov ah, 9
    lea dx, b
    int 21h
    
    lea dx, ksnt       ; In thong bao khong phai so nguyen to
    int 21h    

exit:
    mov ah, 4Ch
    int 21h    

    main endp
end main
