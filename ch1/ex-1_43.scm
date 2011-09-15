#lang scheme

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (cond ((zero? n) (lambda (x) x))
        (else (compose f (repeated f (- n 1))))))

(define (square x) (* x x))

;; 625
((repeated square 2) 5)
