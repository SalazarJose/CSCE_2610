    .data
	.type	v, %object
	.size	v, 3
                           
v:
	.xword	1, 2, 3        // 64-bit values


	.text
	.global	main
	.arch armv8-a+fp+simd
	.type	main, %function

main:
	ADD X0,X0,#0          // let n = 0
  B.L square_sum        // start the square_sum function
  B exit                // end program

square_sum:
    CMP X0,#0
    B.NE else           // if n != 0 go to else label
    ADD X0,X0,#0        // return zero value
    BR X30              // return X30 return link address register
else:
    MUL X1,X0,X0        // n*n to X1
    SUB X2,X0,#1        // n-1 to X2
    ADD X0,X2,X1        // overwrite n with -> (n-1)+(n*n)
    B square_sum        // return to square_sum(n) carrying new n value

exit:
                        // done
