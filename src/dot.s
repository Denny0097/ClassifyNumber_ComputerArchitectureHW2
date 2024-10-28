    .text
    .globl dot
dot:
# vector attributes- a0: vector_1, a1: vector_2, a3: len of vector
    addi    sp, sp, -16
    sw      ra, 0(sp)
    sw      a0, 4(sp)
    sw      a1, 8(sp)
    sw      a2, 12(sp)
    sw      s1, 16(sp)

    li      t1, 0    # i
    # s1: result of dot
    li      s1, 0
dot_loop:
    mul     t0, t1, 4   # i*4
    add     t2, a0, t0  # addr of v1[i]
    add     t3, a1, t0  # addr of v2[i]
    lw      t4, 0(t2)   # val of v1[i]
    lw      t5, 0(t3)   # val of v2[i]
    mul     t0, t4, t5  # mul v1[i], v2[i]
    add     s1, s1, t0  # result += mul result

    addi    t1, t1, 1
    blt     t1, a3, dot_loop    # if (i<len(v)) run dot
return:
    mv      a0, s1
    lw      ra, 0(sp)
    lw      s1, 16(sp)
    addi    sp, sp, 8
    ret