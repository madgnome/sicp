#lang scheme

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;; The expmod algorithm is O(log(n))thanks for the fact
;; the it halves the number of remaining steps whenever the exponent
;; is even.  By calculating the value twice, this version
;; cancels out the benefits of the halving process.