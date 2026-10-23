.global _start

.section .text

_start:
    // Asignación de R según el enunciado
    mov x0, #15         // a_low
    mov x1, #10         // a_high
    mov x2, #20         // b_low
    mov x3, #10         // b_high

    // Copiamos a R temporales para no perder los valores originales al restar
    mov x4, x0
    mov x5, x1

    // Comparamos 128 bits de forma enlazada:
    subs x4, x4, x2     // Resta bits bajos y afecta banderas (Carry out)
    sbcs x5, x5, x3     // Resta bits altos con Carry/Borrow y afecta PSTATE (NZCV)

fin:
    mov x0, #0
    mov x8, #93         // Syscall exit
    svc #0