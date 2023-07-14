; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers.
; Also, in real computers, arithmetic operations are almost always performed with limited precision.
; This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails 
; for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes 
; from one iteration to the next and to stop when the change is a very small fraction of the guess.
; Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?


; good-enough?
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


; good-enough? does not take into consideration the magnitude of the number being "tested".
;
; small numbers
; Say you want to find the square root of 0.0001 . Guess could be 0.000001 and good-enough? would run the calculation abs((0.000001)^2 - 0.0001) = 0.00009999,
; which is less than 0.001, so it would say that 0.000001 is a good enough guess, when it is extremely far off of the correct square root of 0.0001-> 0.01
; In fact, if x < 0.001, any value of guess <= x will result in good-enough? returning true.
; Even if you take the fact that the square root of a number x such that 0 < x < 1 will be greater than x, and ensure that the guesses are larger than x, good-enough? 
; still frequently gives incorrect results. One example would be x=0.0005 and guess=0.007-- this would be "approved" even though 0.007 is far off the true answer of 0.022

;
; large numbers
