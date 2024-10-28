
# ==============================================================================
# FUNCTION: Read a binary matrix from a file and load it into memory.
#
# FILE FORMAT:
#   The first 8 bytes are two 4 byte ints representing the # of rows and columns
#   in the matrix. Every 4 bytes afterwards is an element of the matrix in
#   row-major order.
#
# Arguments:
#   a0 (char*) is the pointer to string representing the filename
#   a1 (int*)  is a pointer to an integer, we will set it to the number of rows
#   a2 (int*)  is a pointer to an integer, we will set it to the number of columns
#
# Returns:
#   a0 (int*)  is the pointer to the matrix in memory
#
# Exceptions:
#   -If any file operation fails, exit with the following codes,
#   48: Malloc error
#   50: fopen error
#   51: fread error
#   52: fclose error
# ==============================================================================

    .text
    .globl read_matrix
read_matrix:

    # Prologue
    addi    sp, sp, -24
    sw      s0, 0(sp)                # s0 is pointer to filename
    sw      s1, 4(sp)                # s1 is pointer to the number of rows
    sw      s2, 8(sp)                # s2 is pointer to the number of columns
    sw      s3, 12(sp)               # s3 is pointer to file descriptor    
    sw      s4, 16(sp)               # s4 is pointer to buffer
    sw      ra, 20(sp)

# open file
    


malloc_exception:
    li a1, 48
    call exit2

fopen_exception:
    li a1, 50
    call exit2

fclose_exception:
    li a1, 51
    call exit2

fread_exception:
    li a1, 52
    call exit2