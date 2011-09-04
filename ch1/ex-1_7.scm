#lang scheme
(define (sqrt-iter guess x imprecise?)
  (if ((if (not imprecise?) good-enough? imprecise-good-enough?) guess x)
      guess
      (sqrt-iter (improve guess x)
                 x 
                 imprecise?)))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (imprecise-good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x)))
     (abs (* guess 0.0001))))

(define (sqrt x)
  (sqrt-iter 1.0 x #f))

(define (imprecise-sqrt x)
  (sqrt-iter 1.0 x #t))

(imprecise-sqrt 0.0001)
;; => 0.03230844833048122

(sqrt 0.0001)
;; => 0.010000714038711746