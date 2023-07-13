;Alyssa P. Hacker doesn’t see why if needs to be provided as a special form.
;“Why can’t I just define it as an ordinary procedure in terms of cond?” she asks.
;Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

#lang sicp

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

; square root procedures
(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


; new square-root program

(define (test x)
  (+ 1 x))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x) x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

; (new-sqrt 1)
(good-enough? 1 2)

(test 1)


; Due to lisp's applicative-order evaluation where a procedure's arguments first get evaluated and then the procedure body executes, the 
; square root program using Alyssa's new-if will enter an infinite loop. This is because sqrt-iter is recursively called in the else clause, and since
; the new-if does not immediately return if true, the else-clause argument will be infinitely evaluated.
