BITS 64

; DOS header minimal
db 'MZ'          ; 2 bytes
dw 0             ; filler
dd 0x40          ; PE offset

; PE signature minimal
db 'PE',0,0,0
dw 0x8664        ; Machine x64
dw 1             ; Sections
dd 0
dd 0
dd 0
dw 0xF0          ; optional header size
dw 0x2           ; executable

; Optional header minimal PE32+
dw 0x20B         ; Magic = PE32+
dd ENTRY         ; AddressOfEntryPoint
dq 0x400000      ; ImageBase
dq 0x1000        ; SectionAlignment
dq 0x200         ; FileAlignment
dw 3             ; Subsystem = Windows CUI
dq 0             ; rest optional zeros

align 16
ENTRY:
    mov rax,0x100
    ret
