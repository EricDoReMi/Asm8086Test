assume cs:codesg

datas segment
   db 'word',0
   db 'unix',0
   db 'wind',0
   db 'good',0
datas ends

stack segment
   db 16 dup(0)
stack ends

codesg segment
start: mov ax,datas
       mov ds,ax
       mov ax,stack
       mov ss,ax
       mov sp,16
       mov bx,0

       mov cx,4

    s: mov si,bx
       push cx
       call capital
       add bx,5
       pop cx
       loop s

       mov ax,4c00h
       int 21h

capital:mov cl,[si]
        mov ch,0
	jcxz ok
	and byte ptr [si],11011111b
	inc si
	jmp short capital

     ok:ret
codesg ends

end start