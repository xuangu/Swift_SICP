//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// church-number
/*
 (define zero
    (lambda (f)
        (lambda (x)
            x)))
 
 (define (add-1 n)
    (lambda (f)
        (lambda (x)
            (f ((n f) x)))))
 
 (define one
    (lambda (f)
        (lambda (x)
            (f x))))
 
 (define two
    (lambda (f)
        (lambda (x)
            (f (f x)))))
 
 (define (church-add m n)
    (lambda (f)
        (lambda (x)
            ((m f) ((n f) x)))))
 
 */

func zero(_ f: (Any) -> Any) -> (Any) -> Any {
    return { (x: Any) -> Any in
        return x
    }
}


func one(_ f: @escaping (Any) -> Any) -> (Any) -> Any {
    return { (x: Any) -> Any in
        return f(x)
    }
}


func two(_ f: @escaping (Any) -> Any) -> (Any) -> Any {
    return { (x: Any) -> Any in
        return f(f(x))
    }
}


func churchAdd(_ a: @escaping (@escaping (Any) -> Any) -> (Any) -> Any, _ b: @escaping (@escaping (Any) -> Any) -> (Any) -> Any) -> (@escaping (Any) -> Any) -> (Any) -> Any {
    
    return { (f: @escaping (Any) -> Any) -> (Any) -> Any in
        return { (x: Any) -> Any in
            return a(f)(b(f)(x))
        }
    }
}


func churchFoo(_ x: Any) -> Any {
    print("\(x)")
    
    return x
}

let x: Any = "abc"

churchAdd(one, two)(churchFoo)("x")