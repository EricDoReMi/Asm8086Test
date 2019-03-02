;在屏幕中间一次显示"A"-"Z",并可以让人看清楚，在显示的过程中，按下ESC键后改变显示的颜色
assume cs:codesg

stack segment
      db 128 dup(0)
stack ends

datas segment
      dw 0,0
datas ends

codesg segment
 start:mov ax,datas
       mov ds,ax
 
       mov ax,stack
       mov ss,ax
       mov sp,128

       mov ax,0
       mov es,ax
       
       cli
       mov ax,es:[9*4];重新来设置int9的位置
       mov word ptr ds:[0],ax
       mov ax,es:[9*4+2]
       mov word ptr ds:[2],ax

       mov word ptr es:[9*4],offset myInt9
       mov word ptr es:[9*4+2],cs

       sti


       mov ax,0b800h
       mov es,ax
       mov ah,'A'
     s:mov es:[160*12+40*2],ah
       call delay
       inc ah
       cmp ah,'Z'
       jna s

       cli
       mov ax,ds:[0]
       mov es:[9*4],ax
       mov ax,ds:[2]
       mov es:[9*4+2],ax
       sti

       mov ax,4c00h
       int 21h

 delay:push ax
       push dx
       mov dx,0ffh
    s0:mov ax,0fffh   
    s1:
       sub ax,1
       cmp ax,0
       jne s1
       sub dx,1
       cmp dx,0
       jne s0

       pop dx
       pop ax

       ret

  myInt9:push ax
         push bx
	 push es

         in al,60h

	 pushf
	 ;pushf
	 ;pop bx
	 ;and bx,11111100b
         ;push bx
	 ;popf

	 call dword ptr ds:[0]

	 cmp al,1
	 jne myint9ed

	 mov ax,0b800h
	 mov es,ax
	 inc byte ptr es:[160*12+40*2+1]


  myint9ed:pop es
           pop bx
	   pop ax
	   iret
       

codesg ends
end start
