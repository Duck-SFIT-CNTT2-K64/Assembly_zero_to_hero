.model small
.stack 100h
.data
    input db 10, 13, 'nhap 1 ki tu: $'
    kitu db ?
.code
    main proc
    ;mo dau
    mov ax, @data
    mov ds, ax    
    
    mov ah, 9
    lea dx, input
    int 21h
    
    
    ;Nhap 1 ki tu
    mov ah, 1
    int 21h
    
    ;in ra ki tu vua nhap
    mov kitu, al ; Vi ki tu vua nhap duoc luu vao thanh al nen can mov vao
    mov ah, 2
    mov dl, kitu
    int 21h
    
    
    ;ket thuc
    mov ah, 4Ch
    int 21h
        
    main endp
end main