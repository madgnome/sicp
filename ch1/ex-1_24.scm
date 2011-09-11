#lang scheme

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1  (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

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
  (let-values (((x y z w) (time-apply fast-prime? (list n 1000))))
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

(search-for-primes 1000 10) ;; 15
(search-for-primes 1000000000 10) ;; 31 (*2)
;; growth should be O(log(n))
;; n is squared between the two steps so the time should
;; double between each steps.