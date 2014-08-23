import UIKit

//Swap values with 1line func
//Swift で2つのオブジェクトを一行でスワップさせる
func swapTwoValues<T>(inout a:T, inout b:T) {
    (a, b) = (b, a)
}

var a = "hoge"
var b = "fuga"

print(a)
print(b)
swapTwoValues(&a, &b)
print(a)
print(b)

(a, b) = (b, a)

var tuple0 : String
var tuple1 : String

(tuple0, tuple1) = ("a", "b")
var tmp = tuple0

swapTwoValues(&tuple0, &tuple1)
if (tmp as AnyObject) === (tuple1 as AnyObject) {
    println("same")
} else {
    println("not same")
}

println(tmp)
println(tuple1)


//Swift における関数のデフォルト引数
//Objective-C のように複数関数を書かなくて良い

func flexStrings(s1 : String = "", s2 : String  = "") {
    if s1 + s2 == "" {
        println("none")
    } else {
        println(s1 + s2)
    }
}

flexStrings()
flexStrings(s1: "One")
flexStrings(s1: "One", s2: "Two")

func function(param1 : AnyObject? = nil, param2 : AnyObject?  = nil) {
    if param1 != nil {
        println("param1")
    }
    
    if param2 != nil {
        println("param2")
    }
}

function()
function(param1: 1)
function(param1: 1, param2: 2)


//Any... でいかなる型の引数を0からいくつでも受ける事が出来る
//難しい
func sumAny(anys : Any...) -> String {
    return String((anys.map({item in
        switch item {
        case "" as String, 0 as Int:
            return -10
        case let s as String where s.toInt() > 0:
            return s.toInt()!
        case is Int:
            return item as Int
        default:
            return 0
        }
    }) as [Int]).reduce(0) {
        $0 + $1
        })
}


let resultEmpty = sumAny() //--> "0"
let result1 = sumAny(Double(), 10, "-10", 2) //--> "12"
let result2 = sumAny("Marin Todorov", 2, 22, "-3", "10", "", 0, 33, -5) //--> "42"



func countFrom(from: Int, #to: Int) {
    println(from)
    if from < to {
        countFrom(from + 1, to: to)
    }
}

countFrom(1, to: 5)
