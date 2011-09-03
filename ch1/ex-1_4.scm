#lang scheme

(require (planet schematics/schemeunit:3))

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(check-equal? (a-plus-abs-b 3 5) (a-plus-abs-b 3 -5))

;; (a-plus-abs-b 3 5)
;; ((if (> 5 0) + -) 3 5))
;; ((if #t + -) 3 5))
;; (+ 3 5)
;; 8

;; (a-plus-abs-b 3 -5)
;; ((if (> -5 0) + -) 3 -5))
;; ((if #f + -) 3 -5))
;; (- 3 -5)
;; 8