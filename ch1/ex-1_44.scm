#lang scheme

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (cond ((zero? n) (lambda (x) x))
        (else (compose f (repeated f (- n 1))))))

(define (square x) (* x x))

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) 
          (f x) 
          (f (+ x dx))) 
       3.0)))

(define (n-fold-smooth f n)
  (repeated (smooth f) n))