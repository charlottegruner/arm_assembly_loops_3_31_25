/* An example of a program that uses a post-test loop (like a do-while loop)
   to do an accumulation from 0 to a user entered number 

        compile with

        gcc -o loop_post  loop_post.s 
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

        ldr     r0, =str2
        ldr     r1, =n
        ldr     r1, [r1]
        bl      printf

        ldr     r2, =n
        ldr     r2, [r2] @end of the loop
        add     r2, r2, #1 @add one to get end of loop
        mov     r0, #0   @accumulator
        mov     r1, #0   @counter 
loop:
        add     r0, r0, r1  @ sum += count
        add     r1, r1, #1  @ count++
        cmp     r1, r2
        bne     loop

        @ print out the sum
        mov     r1, r0          @ put accumulation in r1
        ldr     r0, =str3  @put string address in r0
        bl      printf

        ldmfd   sp!, {lr}
        mov     r0, #0
        mov     pc, lr
        .end
