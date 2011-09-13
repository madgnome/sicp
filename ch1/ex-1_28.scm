#lang scheme

(require (planet schematics/schemeunit:3))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square-check (expmod base (/ exp 2) m) m)
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (miller-rabin n)
  (define (try-it a)
     (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random (- n 2)))))

(check-false (miller-rabin 561))
(check-false (miller-rabin 1105))
(check-false (miller-rabin 1729))
(check-false (miller-rabin 2465))
(check-false (miller-rabin 2821))
(check-false (miller-rabin 6601))