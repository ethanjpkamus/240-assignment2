;Author: Ethan Kamus
;email: ethanjpkamus@csu.fullerton.edu

global assignment2

extern scanf
extern printf

segment .data

       greeting db "The x86 Program has begun", 10, 0

       firstprompt db "Please enter the dividend and press enter: ", 0
       secondprompt db "Please enter the divisor and press enter: ", 0
       thanks db "Thank you.", 10, 0

       quotientprompt db "The quotient of %ld divided by %ld is %ld with remainder %ld", 10, 0

       posremainderprompt db "The remainder is positive.", 10, 0
       negremainderprompt db "The remainder is negative.", 10, 0
       returnremainderpromt db "The remainder will be returned to the caller. Have a nice day!", 10, 0

       errordivzero db "Error: Zero entered for divisor.", 10, 0
       runagainprompt db "Please run the program again", 10, 0
       defaultreturnprompt db "-1 will be returned to the caller", 10, 0

       stringformat db "%s", 0
       integerformat db "%ld", 0


segment .bss
       ;empty

segment .text

assignment2:

       push      rbp
       mov       rbp, rsp

       push      rbx
       push      rcx
       push      rdx
       push      rsi
       push      rdi
       push      r8
       push      r9
       push      r10
       push      r11
       push      r12
       push      r13
       push      r14
       push      r15

;===== print welcome statement =================================================

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, greeting
       call          printf

;===== user input prompt1 ======================================================

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, firstprompt
       call          printf

;===== user input (dividend) ===================================================

       mov           rax, 0
       mov           rdi, integerformat
       push          qword 0
       mov           rsi, rsp
       call          scanf
       pop           r15

;===== user input prompt2 ======================================================

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, secondprompt
       call          printf

;===== user input (divisor) ====================================================

       mov           rax, 0
       mov           rdi, integerformat
       push          qword 0
       mov           rsi, rsp
       call scanf
       pop r14

;===== thanks ==================================================================

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, thanks
       call          printf

;===== check div by zero =======================================================

       cmp           r14, 0
       je            diverror
       jmp           quotient

;===== error divide by zero ====================================================

diverror:

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, errordivzero
       call          printf

       jmp           diverrorpt2

;===== print quotient prompt ===================================================

quotient:

       ;r15: dividend
       ;r14: divisor
       ;r13: quotient
       ;r12: remainder

       ;do division
       mov           rax, r15
       cqo
       idiv          r14
       mov           r13, rax

       ;copy remainder
       mov            r12, rdx

       ;print operation
       mov qword     rax, 0
       mov           rdi, quotientprompt
       mov           rsi, r15
       mov           rdx, r14
       mov           rcx, r13
       mov           r8, r12
       call          printf

       cmp           r12, 0
       jg            posremainder
       jmp           negremainder


;===== return case: divide by zero =============================================

diverrorpt2:

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, runagainprompt
       call          printf

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, defaultreturnprompt
       call          printf

       mov rax, -1

       jmp finish

;===== return case: positive remainder =========================================

posremainder:

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, posremainderprompt
       call          printf

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, returnremainderpromt
       call          printf

       mov           rax, r12
       jmp           finish

;===== return case: negative remainder =========================================

negremainder:

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, negremainderprompt
       call          printf

       mov qword     rax, 0
       mov           rdi, stringformat
       mov           rsi, returnremainderpromt
       call          printf

       mov           rax, r12
       jmp           finish

;===== clear registers =========================================================

finish:

       pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx
	pop rbp

	ret
