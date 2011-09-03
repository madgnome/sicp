#lang scheme

(require (planet schematics/schemeunit:3))

(define (sum-of-largest-squared a b c)
  (define (square x) 
    (* x x))
  (define (sum-of-square a b)
    (+ (square a) (square b)))
  (cond ((and (<= a b) (<= a c))
         (sum-of-square b c))
        ((and (<= b a) (<= b c))
         (sum-of-square a c))
         (else
          (sum-of-square a b))
        ))
  
(check-equal? 13 (sum-of-largest-squared 1 2 3))
(check-equal? 13 (sum-of-largest-squared 3 2 1))
(check-equal? 13 (sum-of-largest-squared 2 3 1))
(check-equal? 10 (sum-of-largest-squared -1 -2 3))