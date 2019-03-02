'名称：letterc
'功能：将以0结尾的字符串中的小写字母转变成大写字母
'参数：ds:si指向字符串首地址

assume cs:codesg,ds:datas

datas segment
      db 'welcome to masm!',0
datas ends

codesg segment
 start:mov ax,datas
       mov ds,ax
       mov si,0
       call letterc

       mov ax,4c00h
       int 21h

letterc:mov al,[si]
        mov ch,0
	mov cl,al
	jcxz s2
        cmp al,61h
	jb s1
	cmp al,7ah
	ja s1
        and al,11011111b
	mov [si],al
    
     s1:inc si    
        jmp letterc

     s2:ret
codesg ends

end start
