#lang scheme

(require (planet schematics/schemeunit:3))

(define (square n) (* n n))

(define (even? n)
   (= (remainder n 2) 0))

;; recursive version
(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp b (/ n 2))))
        (else (* b (fast-exp b (- n 1))))))


;; iterative version
;; b^n = (b^(n/2))^2 = (b^2)^(n/2) if n is even
;; b^n = b*b^(n-1) if n is odd
(define (fast-exp-iter b n)
  (define (exp-iter a b n)
    (cond ((= n 0) a) 
          ((even? n) (exp-iter a (square b) (/ n 2)))
          (else (exp-iter (* a b) b (- n 1)))))
  (exp-iter 1 b n))

(check-equal? 1 (fast-exp-iter 3 0))
(check-equal? 3 (fast-exp-iter 3 1))
(check-equal? 9 (fast-exp-iter 3 2))
(check-equal? 27 (fast-exp-iter 3 3))
