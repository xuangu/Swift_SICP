//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func cons(x: Any, y: Any) -> (Int) -> Any {
    func dispatch(m: Int) -> Any {
        if m == 0 {
            return x
        } else {
            return y
        }
    }
    
    return dispatch
}


func car(z: (Int) -> Any) -> Any {
    return z(0)
}


func cdr(z: (Int) -> Any) -> Any {
    return z(1)
}

let pair = cons(x: "hello", y: "world")

print("\(car(z: pair))")

print("\(cdr(z: pair))")