#lang scheme

(require (planet schematics/schemeunit:3))

;; T(p,q) = (b*q + a*q + a*p, b*p + a*q)
;; T(T(p,q)) = (b*p + a*q)*q + (b*q + a*q + a*p)*q + (b*q + a*q + a*p)*p
;;           = b*p*q + a*q^2 + b*q^2 + a*q^2 + a*p*q + b*q*p + a*q*p + a*p^2
;;           = b*p*q + b*q^2 + b*q*p + a*q^2 + a*q^2 + a*p*q + a*q*p + a*p^2
;;           = b*q^2 + 2*b*p*q + a*q^2 + 2*a*p*q + a*q^2 + a*p^2
;;           = b*(q^2 + 2*p*q) + a*(q^2 + 2*p*q) + a*(q^2 + p^2)
;;
;; => q' = 2pq + q^2
;; => p' = p^2 + q^2

(define (square a)
   (* a a))

(define (even? n)
   (= (remainder n 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))

(check-equal? 1 (fib 1))
(check-equal? 1 (fib 2))
(check-equal? 2 (fib 3))
(check-equal? 3 (fib 4))
(check-equal? 5 (fib 5))
(check-equal? 8 (fib 6))
(check-equal? 13 (fib 7))
(check-equal? 21 (fib 8))
(check-equal? 34 (fib 9))
(check-equal? 55 (fib 10))
