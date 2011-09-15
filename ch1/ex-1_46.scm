#lang scheme

(define (iterative-improve close-enough? f)
  (lambda (first-guess)
    (define (try guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess)))

(define tolerance 0.0001)

(define (average a b) (/ (+ a b) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (new-sqrt n)
  ((iterative-improve
    (lambda (guess next) (< (abs (- guess next)) tolerance))
    (average-damp (lambda (y) (/ n y))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (guess next) (< (abs (- guess next)) tolerance))
    f)
   first-guess))
