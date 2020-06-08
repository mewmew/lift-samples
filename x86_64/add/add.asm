global add

; int add(int x, int y)
;
;    rdi: x
;    rsi: y
add:
	mov rax, rdi
	add rax, rsi ; x + y
	ret
