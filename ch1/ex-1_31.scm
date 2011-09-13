#lang scheme

(require (planet schematics/schemeunit:3))

;; product iterative
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

;; product recursive
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))))

(define (inc n) (+ n 1)) 

(define (ident x) x)

(define (factorial n)
  (product ident 2 inc n))

(define (factorial-rec n)
  (product-rec ident 2 inc n))

(check-equal? 1 (factorial 1))
(check-equal? 2 (factorial 2))
(check-equal? 6 (factorial 3))

(check-equal? 1 (factorial-rec 1))
(check-equal? 2 (factorial-rec 2))
(check-equal? 6 (factorial-rec 3))

;; Wallis product used to calculate pi/2

(define (square n)
  (* n n))

(define (wallis-product k)
  (define (term x)
    (- 1 (/ 1 (square (+ (* 2 x) 1)))))
  (* 2 (product term 1.0 inc k)))

