# hello-world.asm
# Written by: Gabriel Bauer
# Date: 06/02/2023

.globl main  # make main global

.data	# Data section

hello: .asciz "Hello, world!"	# string declaration

.text	# Executable section

main:
	# System Call #64: Write to a file descriptor
	# Requires: a0 (file descriptor), a1 (buffer from which to read, and finally a2 (buffer length)
	
	# In this case, setting a0 to 1 means that we are referencing stdout
	li a0, 1	# li means Load Immediate
	la a1, hello	# la means Load Address
	li a2, 13
	li a7, 64
	ecall
        
	# System Call #93: Exit command
	# Requires: a0 (exit code)

	# If we have made it this far, our program has successfully executed without a problem,
	# so we can just return an error code 0
	li a0, 0 
	li a7, 93
	ecall
