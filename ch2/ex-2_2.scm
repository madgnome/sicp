#lang scheme

;; Segment
(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

;; Point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment s)
  (define (mid c1 c2)
    (/ (- c1 c2) 2))
  (make-point (mid (x-point (end-segment s)) (x-point (start-segment s)))
              (mid (y-point (end-segment s)) (y-point (start-segment s)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Test
(define p1 (make-point 0 0))
(define p2 (make-point 4 4))
(define s (make-segment p1 p2))

(print-point (midpoint-segment s))