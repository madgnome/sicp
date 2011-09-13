#lang scheme

(require (planet schematics/schemeunit:3))

(define (inc n) (+ n 1)) 

(define (ident x) x)

;; accumulate iterative
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

;; accumulate recursive
(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate-rec term (next a) next b))))

;; sum using accumulate
(define (sum term a next b)
  (accumulate + 0 term a next b))

(check-equal? 3 (sum ident 0 inc 2))
(check-equal? 6 (sum ident 0 inc 3))

;; product using accumulate
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (product ident 2 inc n))

(check-equal? 1 (factorial 1))
(check-equal? 2 (factorial 2))
(check-equal? 6 (factorial 3))