    .text
    .globl argmax
argmax:
    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      a0, 4(sp)
    sw      a1, 8(sp)
# a0: vector addr, a1: vector length
# find max
    mv      t0, a0          # use t0 as i to run loop(vector address + i*4)
    li      t1  0           # use t1 record i    
    li      t2, 0           # t2: Maxvalue
loop_for_findMax:
    lw      t3, 0(t0)       # use t3 for store vector[i] 
    ble     t3, t2  next_loop
changeMax:                  # change max value
    mv      t2, t3          
    mv      a0, t1          # a0 record max value's index
    
next_loop:
    addi    t0, t0, 4
    addi    t1, t1, 1
    blt     t1, a1, loop_for_findMax

    lw      ra, 0(sp)
    addi    sp, sp, 8
    ret
    