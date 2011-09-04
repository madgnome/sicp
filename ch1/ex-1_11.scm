#lang scheme

(require (planet schematics/schemeunit:3))

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))))
;; recursive

(define (f n)
  (define (f-iter a b c count)
    (if (= count n)
        a
        (f-iter (+ a (* 2 b) (* 3 c)) a b (+ count 1))))
  (if (< n 3)
      n
      (f-iter 4 2 1 3)))
;; iterative

(define (function-equal? n)
  (check-equal? (f n) (f-rec n)))
  
(function-equal? 0)
(function-equal? 1)
(function-equal? 2)
(function-equal? 3)
(function-equal? 4)
(function-equal? 5)
(function-equal? 6)