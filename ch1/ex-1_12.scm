#lang scheme

(require (planet schematics/schemeunit:3))

(define (pascal-triangle row col)
  (cond ((> col row) 0)
        
        ((= col 1) 1)
        ((+ (pascal-triangle (- row 1) (- col 1))
           (pascal-triangle (- row 1) col)))))

(check-equal? 1 (pascal-triangle 1 1))
(check-equal? 1 (pascal-triangle 2 1))
(check-equal? 1 (pascal-triangle 2 2))
(check-equal? 1 (pascal-triangle 3 1))
(check-equal? 2 (pascal-triangle 3 2))
(check-equal? 1 (pascal-triangle 3 3))
(check-equal? 1 (pascal-triangle 4 1))
(check-equal? 3 (pascal-triangle 4 2))
(check-equal? 3 (pascal-triangle 4 3))
(check-equal? 1 (pascal-triangle 4 4))