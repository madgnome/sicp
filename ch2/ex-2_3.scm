#lang scheme

;; Segment
(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (segment-length s)
  (let ((p1 (start-segment s))
        (p2 (end-segment s)))
    (sqrt (+ (square (- (x-point p2)
                        (x-point p1)))
             (square (- (y-point p1)
                        (y-point p2)))))))

;; Point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment s)
  (define (mid c1 c2)
    (/ (- c1 c2) 2))
  (make-point (mid (x-point (end-segment s)) (x-point (start-segment s)))
              (mid (y-point (end-segment s)) (y-point (start-segment s)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Rectangle
(define (make-rectangle origin width height)
  (list origin width height))

(define (top-rect rect) (+ (y-point (car rect)) (caddr rect)))
(define (bottom-rect rect) (y-point (car rect)))
(define (left-rect rect) (x-point (car rect)))
(define (right-rect rect) (+ (x-point (car rect)) (cadr rect)))

(define (origin-rect rect)
  (make-point (left-rect rect) (bottom-rect rect)))
(define (width-rect rect)
  (- (right-rect rect) (left-rect rect)))
(define (height-rect rect)
  (- (top-rect rect) (bottom-rect rect)))

(define (perimeter-rect rect)
  (+ (* 2 (width-rect rect))
     (* 2 (height-rect rect))))

(define (area-rect rect)
  (* (  rect)
     (height-rect rect)))

;; Rectangle defined by 3 points
;;
;; p1 +
;;    |
;;    |
;; p2 +------+ p3
(define (make-rectangle p1 p2 p3)
  (cons (make-segment p1 p2) (make-segment p2 p3)))

(define (width-rect r)
  (segment-length (cdr r)))

(define (height-rect r)
  (segment-length (car r)))