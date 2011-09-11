#lang scheme

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

(define (square n)
  (* n n))

(define (timed-prime? n)
  (let-values (((x y z w) (time-apply prime? (list n))))
    (cond ((car x) 
           (display n) (display " -> ") (display y)
           #t)
          (else #f))))

(define (search-for-primes start times)
  (cond ((= times 0) #t)
        (else 
          (cond ((even? start) (search-for-primes (+ start 1) times))
                ((timed-prime? start)
                   (newline)
                   (search-for-primes (+ start 1) (- times 1)))
                (else (search-for-primes (+ start 1) times))))))

(search-for-primes 1000000000 3) ;; => 15
(search-for-primes 10000000000 3) ;; => 47 (*3.13)
(search-for-primes 100000000000 3) ;; => 124 (*2.63)
(search-for-primes 1000000000000 3) ;; => 374 (*3.0)
(search-for-primes 10000000000000 3) ;; => 884 (*2.74)
(search-for-primes 100000000000000 3) ;; => 2823 (*3.1)
;; sqrt(n) = 3.16
;; n is increased by 10 each time, we expect the ratio to be close to sqrt(10).
;; The time growth of the prime number detector follows our expectations.