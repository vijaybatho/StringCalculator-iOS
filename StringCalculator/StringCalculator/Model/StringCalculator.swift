//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Vijay Batho on 05/06/25.
//

//MARK: StringCalculator
class StringCalculator {
    func add(_ numbers: String) -> Int {
        return numbers.isEmpty ? 0 : Int(numbers) ?? 0
    }
}
