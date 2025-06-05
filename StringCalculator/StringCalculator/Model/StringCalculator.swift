//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Vijay Batho on 05/06/25.
//

import Foundation

//MARK: String Calculator
class StringCalculator {
    func add(_ numbers: String) -> Int {
        if numbers.isEmpty { return 0 }

        var delimiterSet = CharacterSet(charactersIn: ",\n")
        var numbersToProcess = numbers

        if numbers.hasPrefix("//") {
            let parts = numbers.components(separatedBy: "\n")
            if let delimiterLine = parts.first {
                let delimiterChar = delimiterLine.dropFirst(2) //This line will remove "//"
                delimiterSet = CharacterSet(charactersIn: String(delimiterChar))
                numbersToProcess = parts.dropFirst().joined(separator: "\n")
            }
        }

        let numberArray = numbersToProcess.components(separatedBy: delimiterSet)
        let negatives = numberArray.compactMap { Int($0) }.filter { $0 < 0 }

        if !negatives.isEmpty {
            let negativesStr = negatives.map { String($0) }.joined(separator: ",")
            fatalError("negative numbers not allowed \(negativesStr)")
        }

        return numberArray.compactMap { Int($0) }.reduce(0, +)
    }

}
