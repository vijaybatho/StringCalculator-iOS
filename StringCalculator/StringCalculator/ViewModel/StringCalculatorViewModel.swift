//
//  StringCalculatorViewModel.swift
//  StringCalculator
//
//  Created by Vijay Batho on 05/06/25.
//

//MARK: String Calculator View Model
class StringCalculatorViewModel {
    private let calculator = StringCalculator()
    
    func calculateResult(from input: String) throws -> String {
        let result = try calculator.add(input)
        return String(result)
    }
}
