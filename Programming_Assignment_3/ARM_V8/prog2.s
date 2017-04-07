    .data
	.type	v, %object
	.size	v, 3
                           //v array
v:
	.xword	1, 2, 3        // 64-bit values


	.text
	.global	main
	.arch armv8-a+fp+simd
	.type	main, %function

main:
	ADD X0,X0,#0          // let min = 0
	ADD X1,X1,#0          // let max = 0
	ADD X2,X2,#1          // let sum = 0
	ADD X3,X2,#1          // let i = 1
loop:
	CMP X3,X4             // Compare i(X3) and input(X4) values
	B.GT exit             // if i(X3) is greater than input(X4) value, go to exit label.
	CMP X3,#1             // compare i(X3) and '1'
	B.NE next             // if i(X3) != '1' go to next label.
	ADD X1,X5,#0          // if equal, then set max(X1) = n (X5)
	ADD X0,X5,#0          // and set min(X0) = n (X5)
	B sum                 // branch to sum label.
next:
    CMP X5,X1             // compare n (X5) and max (X1)
    B.LT next2            // if n is less than max, branch to next2 label
    ADD X1,X5,#0          // if n is greater than max, then max = n
    B sum                 // branch to sum label
next2:
    ADD X0,X5,#0          // else if set min = n
sum:
    ADD X2,X2,X5          // sum (X2) += n (X5)
    B loop                // go back to loop label

exit:
    SDIV X6,X2,X4         // mean(X6)= sum(X2) / input (X4)
