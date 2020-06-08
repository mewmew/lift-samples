global add:function

; long add(long x, long y)
;
;    rdi: x
;    rsi: y
add:
	mov rax, rdi
	add rax, rsi ; x + y
	ret
