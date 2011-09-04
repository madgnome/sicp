#lang scheme

(require (planet schematics/schemeunit:3))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x)))
     (abs (* guess 0.0001))))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(define (check-delta x y epsilon)
  (check < (abs (- x y)) epsilon))

(check-delta 3 (cbrt 27) 0.0001)