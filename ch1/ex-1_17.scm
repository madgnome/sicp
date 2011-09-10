#lang scheme

(require (planet schematics/schemeunit:3))

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (even? n)
   (= (remainder n 2) 0))

;; O(n)
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

;; O(log n)
(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mul (double a) (halve b)))
        (else (+ a (fast-mul a (- b 1))))))



(check-equal? 0 (fast-mul 3 0))
(check-equal? 3 (fast-mul 3 1))
(check-equal? 18 (fast-mul 3 6))