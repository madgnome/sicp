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

(define (event? n)
  (= (remainder n 2) 0))

(define (unit i) 1.0)

;; 2.7182817182817183
(+ 2.0 (cont-frac-iter unit 
                       (lambda (i)
                         (cond ((= (remainder i 3) 2)
                                (+ 2 (* 2 (quotient i 3))))
                               (else 1)))
                       10))

