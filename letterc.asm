'���ƣ�letterc
'���ܣ�����0��β���ַ����е�Сд��ĸת��ɴ�д��ĸ
'������ds:siָ���ַ����׵�ַ

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
