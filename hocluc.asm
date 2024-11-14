.model small
.stack 100h
.data
    msgt db 10, 13, 'Nhap diem toan: $'
    msgl db 10, 13, 'Nhap diem ly: $'
    msgh db 10, 13, 'Nhap diem hoa: $'
    msg db 10, 13, 'Tong diem: $'
    msgr db 10, 13, 'Xep loai: $'
    hgioi db 'Gioi$'
    hkha db 'Kha$'
    hkem db 'Kem$'
    t db 0
    l db 0
    h db 0
    tong db 0
.code
main PROC
    ; nap dia chi du lieu vao bo nho
    mov ax, @data
    mov ds, ax

nhapt:    
    ; thong bao nhap diem toan
    mov ah, 9
    lea dx, msgt
    int 21h
    
    mov bl, 10;

nhaptt:    
    mov ah, 1
    int 21h
    ; kiem tra chu so
    cmp al, '0'
    jb nhapt
    cmp al, '9'
    ja nhapt
    ; luu so
    sub al, '0' ; chuyen chu so ve so
    mov cl, al  ; chuyen so vua nhap vao cl
    mov al, t   ; chuyen t vao al
    mul bl      ; t * 10
    add al, cl  ; t * 10 + nhap
    mov t, al   ; luu so
    cmp al, 1   ; kiem tra xem t = 1?
    je nhaptt
    
    nhapl:    
    ; thong bao nhap diem ly
    mov ah, 9
    lea dx, msgl
    int 21h

nhaptl:    
    mov ah, 1
    int 21h
    ; kiem tra chu so
    cmp al, '0'
    jb nhapl
    cmp al, '9'
    ja nhapl
    ; luu so
    sub al, '0' ; chuyen chu so ve so
    mov cl, al  ; chuyen so vua nhap vao cl
    mov al, l   ; chuyen t vao al
    mul bl      ; t * 10
    add al, cl  ; t * 10 + nhap
    mov l, al   ; luu so
    cmp al, 1   ; kiem tra xem t = 1?
    je nhaptl
    
    nhaph:    
    ; thong bao nhap diem hoa
    mov ah, 9
    lea dx, msgh
    int 21h

nhapth:    
    mov ah, 1
    int 21h
    ; kiem tra chu so
    cmp al, '0'
    jb nhaph
    cmp al, '9'
    ja nhaph
    ; luu so
    sub al, '0' ; chuyen chu so ve so
    mov cl, al  ; chuyen so vua nhap vao cl
    mov al, h   ; chuyen t vao al
    mul bl      ; t * 10
    add al, cl  ; t * 10 + nhap
    mov h, al   ; luu so
    cmp al, 1   ; kiem tra xem t = 1?
    je nhapth
    
    ; tinh tong
    mov ah, tong
    mov al, t
    add ah, al  ; tong = t
    mov al, l
    add ah, al  ; tong = t + l
    mov al, h
    add ah, al  ; tong = t + l + h
    mov tong, ah ; luu tong
    
    ; thong bao in tong
    mov ah, 9
    lea dx, msg
    int 21h
    
    ; in tong
    mov bh, 0 ; dem so chu so cua tong
    mov ax, 0
    mov al, tong
chiatiep:
    mov ah, 0
    div bl
    add ah, 48 ; chuyen so ve chu so
    mov dx, 0  ; reset dx = 0
    mov dl, ah ; dx = ah
    push dx
    inc bh
    cmp al, 0
    jne chiatiep
    
    mov cx, 0  ; reset cx = 0
    mov cl, bh ; cx = so chu so
inso:    
    mov ah, 2
    pop dx
    int 21h
    loop inso
    
    ; thong bao hoc luc
    mov ah, 9
    lea dx, msgr
    int 21h
    
    mov bl, tong
    cmp bl, 20
    jae gioi
    cmp bl, 10
    jae kha
    jmp kem
    
gioi:
    mov ah, 9
    lea dx, hgioi
    int 21h
    jmp kthuc

kha:
    mov ah, 9
    lea dx, hkha
    int 21h
    jmp kthuc

kem:
    mov ah, 9
    lea dx, hkem
    int 21h

kthuc:    
    ; ket thuc chuong trinh
    mov ah, 4Ch
    int 21h
main ENDP
END main

