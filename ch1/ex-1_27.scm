#lang scheme

(require (planet schematics/schemeunit:3))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (next test-divisor)
    (if (= test-divisor 2) 3 (+ test-divisor 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor )))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (square n)
  (* n n))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1  (random (- n 1)))))

(define (test-carmichael n)
  (define (try-it a)
    (cond ((= a n) #t)
          ((= (expmod a n n) a) (try-it (+ a 1)))
          (else #f)))
  (try-it 1))

(define (carmichael? n)
  (if (test-carmichael n)
      (not (prime? n))
      #f))

(check-true (carmichael? 561))
(check-true (carmichael? 1105))
(check-true (carmichael? 1729))
(check-true (carmichael? 2465))
(check-true (carmichael? 2821))
(check-true (carmichael? 6601))