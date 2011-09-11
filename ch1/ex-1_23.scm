#lang scheme

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

(search-for-primes 1000000000 3) ;; => 5
(search-for-primes 10000000000 3) ;; => 31 
(search-for-primes 100000000000 3) ;; => 68
(search-for-primes 1000000000000 3) ;; => 296 
(search-for-primes 10000000000000 3) ;; => 764 
(search-for-primes 100000000000000 3) ;; => 2387 
;; It is faster but not twice as fast, this could be
;; explain by the fact that we replaced a primitive operation (+ test-divisor 1)
;; by a more complex operation.