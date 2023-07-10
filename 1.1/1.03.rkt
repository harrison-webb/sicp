; Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers

#lang sicp

(define (sumSquaresOfLargestTwo a b c)
  (cond ((and (<= a b) (<= a c)) (sumOfSquares b c))
        ((and (<= b a) (<= b c)) (sumOfSquares a c))
        (else (sumOfSquares a b))))

(define (square x)
  (* x x))

(define (sumOfSquares x y)
  (+ (square x) (square y)))

(define (<= a b)
  (or (< a b) (= a b)))

(sumSquaresOfLargestTwo 1 2 3)
(sumSquaresOfLargestTwo 1 1 1)
(sumSquaresOfLargestTwo 0 0 0)