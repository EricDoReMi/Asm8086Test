;实现一个子程序setscreen，为显示输出提供如下功能
;(1)清屏
;(2)设置前景色
;(3)设置背景色
;(4)向上滚动一行
;用ah寄存器传递功能号：0，清屏  1：设置前景色  2：设置背景色  3：表示向上滚动一行
;对于2,3号功能，用al传送颜色值，al 属于 0,1,2,3,4,5,6,7

assume cs:codesg


codesg segment

start:mov ax,102h
      call screenset

       mov ax,4c00h
       int 21h
 screenset:
      jmp short screenSt
      table dw sub1,sub2,sub3,subF
      
      

 screenSt:push bx
       cmp ah,3
       ja screensetEnd

       mov bl,ah
       mov bh,0
       add bl,bl

       call word ptr table[bx]
   
screensetEnd:pop bx
             ret

       

  sub1:push ax
       push bx
       push cx
       push es

       mov ax,0b800h
       mov es,ax
       mov bx,0
       mov cx,2000

 sub1S:mov byte ptr es:[bx],' '
       add bx,2
       loop sub1S
       
       pop es
       pop cx
       pop bx
       pop ax
       ret
       
  sub2:push ax
       push bx
       push cx
       push es

       mov bx,0b800h
       mov es,bx
       mov bx,1
       mov cx,2000

 sub2S:and byte ptr es:[bx],11111000b
       or es:[bx],al
       add bx,2
       loop sub2S

       pop es
       pop cx
       pop bx
       pop ax

       ret

  sub3:push ax
       push bx
       push cx
       push es
     
       mov cl,4
       shl al,cl

       mov bx,0b800h
       mov es,bx
       mov bx,1
       mov cx,2000

 sub3S:and byte ptr es:[bx],1000111b
       or es:[bx],al
       add bx,2
       loop sub3S

       pop es
       pop cx
       pop bx
       pop ax

       ret

  subF:push ax
       push bx
       push cx
       push es
       push si
       push di
       
       mov bx,0b800h
       mov ds,bx
       mov es,bx

       mov si,160
       mov di,0
       
       cld
       mov cx,24
       
  subFS:push cx
	mov cx,160
	rep movsb
	pop cx
        loop subFS 
        
	mov bx,0
        mov cx,80
	

 subFEd:mov byte ptr [160*24+bx],' '
        add bx,2
	loop subFEd

	pop di
	pop si
	pop es
	pop cx
	pop bx
	pop ax
	ret

codesg ends
end start