//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Vijay Batho on 05/06/25.
//

//MARK: String Calculator
class StringCalculator {
    func add(_ numbers: String) -> Int {
        if numbers.isEmpty { return 0 }
        let numberArray = numbers.components(separatedBy: ",")
        return numberArray.compactMap { Int($0) }.reduce(0, +)    }
}
