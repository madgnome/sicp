#lang scheme

(define (f g)
  (g 2))

(define (square x) (* x x))

;; => 4
(f square)

;; => 10
(f (lambda (z) (* z (+ z (+ z 1)))))

(f f)
;; (f 2)
;; (2 2)
;; Error procedure application: expected procedure, given: 2; arguments were: 2