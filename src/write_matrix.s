
# ==============================================================================
# FUNCTION: Write a matrix to a binary file. Use the following exit codes for errors.
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
#   None
#
# Exceptions:
#   -If any file operation fails, exit with the following codes,
#   53: fopen error
#   54: fwrite error
#   55: fclose error
# ==============================================================================


    .text
    .globl  write_matrix
write_matrix:
    addi    sp, sp, -16



    

fopen_exception:
    li a1, 53
    call exit2
fopen_exception:
    li a1, 53
    call exit2
fopen_exception:
    li a1, 53
    call exit2