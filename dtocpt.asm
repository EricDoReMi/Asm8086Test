'名称：dtoc
'功能：将word型数据转变为十进制数的字符串，字符串应以0结尾
'参数：(ax)=word型数据
'      ds:si 指向字符串的首地址
'返回：无
'应用举例：在屏幕8行3列，用绿色显示12666中的字符串

assume cs:codesg

datas segment
      dw 123,12666,1,8,3,38
datas ends

results segment
      dw 20 dup(0)
results ends

stack segment
     dw 20 dup(0)
stack ends


codesg segment

start: mov ax,datas
       mov ds,ax
       mov ax,results
       mov es,ax
       
       mov cx,6
       call initset
       call dtocNo

      
       mov dh,8
       mov dl,3
       mov cl,2
       mov ax,results
       mov ds,ax
       mov ax,0B800h
       mov es,ax
       call initset
       call clear_scr
       call show_str

       mov ax,4c00h
       int 21h

initset:mov si,0
        mov di,0
        mov ax,stack
        mov ss,ax
        mov sp,40

	ret
     
dtocNo:push cx
       mov bx,0
       mov ax,[si]
       
       
dNo_s: mov dx,0
       mov cx,0ah
       div cx
       mov cx,ax
       jcxz short okdNo
       
       add dx,30h
       push dx
       inc bx
      
       
       jmp short dNo_s

okdNo: add dx,30h
       push dx
       inc bx
       mov cx,bx
   s3: pop ax
       mov es:[di],al
       inc di
       loop s3
       mov al,2ch
       mov es:[di],al
       inc di
       add si,2
       pop cx
       loop dtocNo
       mov al,0
       mov es:[di],al
       
       ret

     

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