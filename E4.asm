.data
A:      .word 10, 20, 30, 40, 50
sum:    .word 0
N:      .word 5
i:      .word 0
step:   .word 1

.text
.globl main

main:
    la   $t0, A          # $t0 = &A
    lw   $t1, sum        # $t1 = sum
    lw   $t2, i          # $t2 = i
    lw   $t3, N          # $t3 = N
    lw   $t4, step       # $t4 = step

loop:
    mul  $t5, $t2, 4     # $t5 = i * 4 (word offset)
    add  $t6, $t0, $t5   # $t6 = &A[i]
    lw   $t7, 0($t6)     # $t7 = A[i]

    add  $t1, $t1, $t7   # sum += A[i]
    add  $t2, $t2, $t4   # i += step

    bne  $t2, $t3, loop  # if i != N, loop

    sw   $t1, sum        # store sum

    # Print the sum
    li   $v0, 1
    move $a0, $t1
    syscall

    # Print newline (optional)
    li   $v0, 11
    li   $a0, 10
    syscall

    li   $v0, 10         # Exit
    syscall

