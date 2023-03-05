//
//  MathService.swift
//  UnitTestingApp
//
//  Created by Carolina on 5.03.23.
//

import Foundation

enum DivisionError: Error {
    case divisionByZero
}

final class MathService {
    
    func additionOfTwoNumbers(firstNumber: Int, secondNumber: Int) -> Int {
        let number = firstNumber + secondNumber
        return number
    }
    
    func multiplicationOfTwoNumbers(firstNumber: Int, secondNumber: Int) -> Int {
        let number = firstNumber * secondNumber
        return number
    }
    
    func divide(_ dividend: Double, by divisor: Double) throws -> Double {
        guard divisor != 0 else {
            throw DivisionError.divisionByZero
        }
        return dividend / divisor
    }
}
