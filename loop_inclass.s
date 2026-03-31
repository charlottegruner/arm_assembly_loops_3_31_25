/* example of a pre-test loop that accumulates
   all the numbers from 0 to a user number 

        compile this with

        gcc -o loop_inclass loop_inclass.s
*/
        .data
str0:   .asciz "Enter a number: "
str1:   .asciz  "%d"
str2:   .asciz  "You entered %d\n"
strx:   .asciz  "%x"
str3:   .asciz  "The sum is %d\n"
        .align  2
n:      .word   0

        .text
        .globl main
main:   stmfd   sp!, {lr}

        ldr     r0, =str0
        bl      printf

        ldr     r0, =str1
        ldr     r1, =n
        bl      scanf

        @ write a loop that adds all the numbers from one to the user input number
        ldr     r2, =n
        ldr     r2, [r2]        @ end of loop user number
        add     r2, r2, #1
        mov     r0, #0          @ r0 is the accumulator, intialized to 0
        mov     r1, #0          @ r1 holds the counter that goes from 0 to the user input  
loop:   cmp     r1, r2
        beq     end
        add     r0, r0, r1
        add     r1, r1, #1
        b       loop

end:    @end of loop

        @ marshal the arguments to call printf 
        mov     r1, r0
        ldr     r0, =str3
        bl      printf

        ldmfd   sp!, {lr}
        mov     r0, #0
        mov     pc, lr
        .end
