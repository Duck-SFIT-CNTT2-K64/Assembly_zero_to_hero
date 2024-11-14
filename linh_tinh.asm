;ham 2ch, ngat 21h : lay thoi gian  
;ham 2ah, ngat 21h;
;al: thu (0: sun, 1: MON, ... 6: SAT)
;dl: ngay(1-32), dh: thang (1-12)
;cx : nam (1980-2099) 

.model small
.stack 100h
.data
     ngay       db  ?
     thang      db  ?
     nam        dw  ?
     chunhat    db  'chunhat$'
     thuhai     db  'Thu hai$'
     thuba      db  'Thu ba$'
     
.code
main proc
    mov ax, @data
        mov ds, ax
        
        mov ah, 2ah
        int 21h   
        
        mov ngay , dl
        mov thang, dh
        mov nam, cx
        
        cmp al, 0
        je SUM
        cmp al, 1
        je MON
        cmp al, 2
        je TUE
        
SUM:
        mov ah, 9
        lea dx, chunhat
        int 21h 
        jmp hienngay
MON:    
        mov ah,9
        lea dx, thuhai
        int 21h   
        jmp hienngay
TUE:    
        mov ah, 9
        lea dx, thuba
        int 21h
        jmp hienngay
hienngay:
        mov ah, 2
        mov dl, ' '
        int 21h 
        
        mov al, ngay
        mov ah, 0
        mov bl, 10
        div bl
        mov bh, ah
        
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        
        mov dl, bh
        add dl , 48
        int 21h
        mov dl, '/'
        int 21h
        
        mov al, thang
        mov ah, 0
        mov bl, 10
        div bl
        mov bh, ah
        
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        
        mov dl, bh
        add dl , 48
        int 21h
        mov dl, '/'
        int 21h
        
        mov ax, nam
        mov bx, 10
        mov cx, 4
chiatiep:        
        mov dx, 0
        div bx
        push dx
        loop chiatiep
        
        mov cx, 4
        
        pop dx
        add dl, 48
        mov 
        
        mov ah, 4ch
        int 21h
    
    main endp
end main