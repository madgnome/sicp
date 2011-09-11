#lang scheme

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;; The original expmod does not ever calculate the
;; exponentiated value.  At each stage the return value is taken mod n
;; (where n is the number being tested).  So the largest value expmod
;; would deal with would be around the magnitude of n^2.
;;
;; Alyssa's version would make it quite difficult to test larger numbers.
