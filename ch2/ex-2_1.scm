#lang scheme

(require (planet schematics/schemeunit:3))

(define (make-rat n d) 
  (let ((g (gcd n d)))
    (cond ((< d 0)
             (make-rat (- n) (- d)))
          (else
             (cons (/ n g) (/ d g))))))


(check-equal? (cons 3 4) (make-rat 3 4))
(check-equal? (cons -3 4) (make-rat -3 4))
(check-equal? (cons 3 4) (make-rat -3 -4))
(check-equal? (make-rat -3 4) (make-rat 3 -4))