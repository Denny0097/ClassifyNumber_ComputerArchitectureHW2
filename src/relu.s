    .text   
    .globl relu
relu:
    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      a0, 8(sp)
    bgt     a0, x0, return
    li      a0, 0
return:
    lw      ra, 0(sp)
    addi    sp, sp, 8
    ret