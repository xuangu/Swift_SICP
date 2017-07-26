//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let dx = 0.000001
// 对函数g求导数
func deriv(g: @escaping (Double) -> Double) -> (Double) -> Double {
    return { (x: Double) in
        return (g(x + dx) - g(x)) / dx
    }
}


func myCube(_ x: Double) -> Double {
    return x * x * x
}

deriv(g: myCube)(4)  // ((4)^3)' = 3 * 4 ^ 2


// 求函数不动点
let tolerance = 0.000001

func fixedPoint(f: @escaping (Double) -> Double, firstGuess: Double) -> Double {
    func closeEnough(_ v1: Double, _ v2: Double) -> Bool {
        return abs(v1 - v2) < tolerance
    }
    
    func tryValue(guess: Double) -> Double {
        let next = f(guess)
        if closeEnough(next, guess) {
            return next
        } else {
            return tryValue(guess: next)
        }
    }
    
    return tryValue(guess: firstGuess)
}

fixedPoint(f: cos, firstGuess: 1.0)

// 求g(x) = 0的解，就是求f(x) = x - g(x)/Dg(x)的不动点
func newtonTransform(g: @escaping (Double) -> Double) -> (Double) -> Double {
    return { (x: Double) -> Double in
        return x - g(x) / deriv(g: g)(x)
    }
}

func newtonMethod(g: @escaping (Double) -> Double, guess: Double) -> Double {
    return fixedPoint(f: newtonTransform(g: g), firstGuess: guess)
}

// 将根号x的求解转换为g(x) = x - y^2的不动点。
func mySqrt(_ x: Double) -> Double {
    return newtonMethod(g: { (y: Double) -> Double in
        return (y * y - x)
    }, guess: 1.0)
}

mySqrt(4)
