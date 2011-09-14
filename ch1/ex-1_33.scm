#lang scheme

(require (planet schematics/schemeunit:3))

(define (inc n) (+ n 1)) 
(define (ident x) x)
(define (square n) (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; accumulate iterative
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (if (filter a)
                           (combiner (term a) result)
                           result))))
  (iter a null-value))

;; sum
(define (filtered-sum term a next b filter)
  (filtered-accumulate + 0 term a next b filter))

(define (sum-of-prime-squared a b)
  (filtered-sum square a inc b prime?))

(check-equal? 39 (sum-of-prime-squared 1 5))
(check-equal? 88 (sum-of-prime-squared 1 10))

;; product
(define (filtered-product term a next b filter)
  (filtered-accumulate * 1 term a next b filter))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-of-relative-prime n)
  (define (relative-prime? k)
    (= (gcd k n) 1))
  (filtered-product ident 1 inc n relative-prime?))

(check-equal? 189 (product-of-relative-prime 10))