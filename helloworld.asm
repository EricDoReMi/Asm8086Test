'���ƣ�show_str
'���ܣ���ָ����λ�ã���ָ������ɫ����ʾһ����0�������ַ���
'������(dh)=�к�(ȡֵ��ΧΪ0-24)��(dl)=�к�(ȡֵ��ΧΪ0-79)
'      (cl)=��ɫ��ds:siָ���ַ������׵�ַ
'���أ���
'Ӧ�þ���������Ļ8��3�У�����ɫ��ʾdata���е��ַ���

assume cs:codesg

datas segment
      db 'Hello World!',0
datas ends

stack segment
     dw 8 dup(0)
stack ends

codesg segment

start: mov dh,8
       mov dl,3
       mov cl,2
       mov ax,datas
       mov ds,ax
       mov ax,0B800h
       mov es,ax
       mov ax,stack
       mov ss,ax
       mov sp,16
       mov si,0
       call clear_scr
       call show_str

       mov ax,4c00h
       int 21h

clear_scr:push cx
          mov cx,70dh
          mov di,0
     scr_s:mov al,0
           mov es:[di],al
	   add di,2
	   loop scr_s
	   pop cx

	   ret


show_str:mov al,0a0h
	 mul dh
	 mov di,ax
         mov al,2
	 mul dl
	 add di,ax
	 
      s: push cx
         mov ch,0
         mov cl,[si]
	 jcxz short ok
         
	 mov al,[si]
	 mov es:[di],al
	 pop cx
	 mov es:[di+1],cl
	 
         inc si
	 add di,2

	 jmp short s

     ok: pop cx
     
         ret

       
	


codesg ends

end start