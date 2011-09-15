#lang scheme

(define (cont-frac n d k)
  (define (rec i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (rec (+ i 1))))))
  (rec 1))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (tan-cf x k)
  (cont-frac-iter (lambda (n) 
                    (if (= n 1) x (- (* x x))))
                  (lambda (k) (- (* 2 k) 1))
                  k))
;; 0.00000000039
(tan-cf 3.14159265 50)

