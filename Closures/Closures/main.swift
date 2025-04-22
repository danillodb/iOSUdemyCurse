//
//  main.swift
//  Closures
//
//  Created by Danillo Diniz Barbosa on 12/04/25.
//

import Foundation

func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let result1 = calculator(n1: 2, n2: 3, operation: sum)
print(result1)

let result2 = calculator(n1: 2, n2: 3, operation: { (no1: Int, no2: Int) -> Int in return no1 + no2 })
print(result2)

let result3 = calculator(n1: 2, n2: 3, operation: { (no1, no2) -> Int in return no1 + no2 })
print(result3)

let result4 = calculator(n1: 2, n2: 3, operation: { (no1, no2) in return no1 + no2 })
print(result4)

let result5 = calculator(n1: 2, n2: 3, operation: { (no1, no2) in no1 + no2 })
print(result5)

let result6 = calculator(n1: 2, n2: 3, operation: { $0 + $1 })
print(result6)

let result7 = calculator(n1: 2, n2: 3, operation: +)
print(result7)

let result8 = calculator(n1: 2, n2: 3) { $0 + $1 }
print(result8)

let array = [6,2,4,9,3,1]
let sortedArray = array.sorted { $0 < $1 }
print(sortedArray)

let addToArray = array.map { $0 + 1 }
print(addToArray)

let stringArray = array.map {"\($0)"}
print(stringArray)

let evenNumbers = array.filter { $0.isMultiple(of: 2) }
print(evenNumbers)
