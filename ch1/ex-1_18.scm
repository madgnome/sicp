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

;; O(log n) recursive
(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mul (double a) (halve b)))
        (else (+ a (fast-mul a (- b 1))))))

;; O(log n) iterative
(define (fast-mul-iter a b)
  (define (mul-iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (mul-iter (double a) (halve b) acc))
          (else (mul-iter a (- b 1) (+ a acc)))))
  (mul-iter a b 0))

(check-equal? 0 (fast-mul-iter 3 0))
(check-equal? 3 (fast-mul-iter 3 1))
(check-equal? 18 (fast-mul-iter 3 6))