    .text
    .globl matmul
matmul:
# matrixs addr- a0: m0, a3: m1, a6: output
    addi    sp, sp, -28
    sw      ra, 0(sp)
    sw      a0, 4(sp)
    sw      a1, 8(sp)
    sw      a2, 12(sp)
    sw      a3, 16(sp)
    sw      a4, 20(sp)
    sw      a5, 24(sp)
    sw      a6, 28(sp)

    # Error checks
    ble     a1, x0, error_m0
    ble     a2, x0, error_m0
    ble     a4, x0, error_m1
    ble     a5, x0, error_m1   
    bne     a2, a4, error_not_match



    li      t1, 0       # row for output,(r)
outer_loop:
    bge     t1, a1, end_outer # loop until r >= (m0 row size)

    li      t0, 0       # col for output,(c)
inner_loop:
    bge     t0, a1, end_inner # loop until c >= (m0 col size)

    li      t2, 0       # t2: i
    li      s1, 0       # s1: temp result   
mul_loop:
# lw m0[r, i] 
    mul     t3, t1, a2
    add     t3, t3, t2
    add     t3, t3, a0
    lw      s2, 0(t3)   # s2 record m0[r, i] 
# lw m1[i, c]
    mul     t3, t2, a5
    add     t3, t3, t0
    add     t3, t3, a3
    lw      s3, 0(t3)   # s3 record m1[i, c]

# m0[r, i] * m1[i, c], and sum up store into output[r, c]
    mul     t3, s2, s3  
    add     s1, s1, t3  

    addi    t2, t2, 1
    ble     t2, a1, mul_loop # loop until i >= (m0 col size)
end_mul:
# sw temp reslut into output[r, c]
    mul     t3, t1, a1
    add     t3, t3, t0
    add     t3, t3, a6
    sw      s1, 0(t3)

    addi    t0, t0, 1
    blt     t0, a2, inner_loop
end_inner:
    
    addi    t1, t1, 1
    blt     t1, a1, outer_loop
end_outer:
    addi    sp, sp, 28
    lw      ra, 0(sp)
    ret


error_m0:
    li      a1, 4 
    ecall
error_m1:
    li      a1, 4
    ecall
error_not_match:
    li      a0, 4
    ecall