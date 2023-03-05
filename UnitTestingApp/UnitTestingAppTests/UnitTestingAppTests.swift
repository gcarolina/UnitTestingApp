//
//  UnitTestingAppTests.swift
//  UnitTestingAppTests
//
//  Created by Carolina on 5.03.23.
//
import XCTest

@testable import UnitTestingApp

final class UnitTestingTests: XCTestCase {

    var sut: MathService! // ссылка - system under test (ссылка на тестируемый модуль)
    
    override func setUp() {
        print("setUp()")
        super.setUp() // до создания объектов
        sut = MathService()
    }
    
    /// (как deinit в контроллере)
    // tearDownWithError -> tearDown
    // вызывается после окончания тестирования модуля, для выгрузить из памяти
    override func tearDown() {
        print("tearDown()")
        sut = nil
        super.tearDown() // обязательно после выгрузки объектов
    }

    func testAddition() {
        // GIVEN
        let numberOne = 2
        let numberTwo = 3
        
        // WHEN
        let result = sut.additionOfTwoNumbers(firstNumber: numberOne, secondNumber: numberTwo)
        
        // THEN
        XCTAssertEqual(result, 5, "Expected result to be 5")
    }
    
    func testMultiplication() {
        // GIVEN
        let numberOne = 10
        let numberTwo = 3
        
        // WHEN
        let result = sut.multiplicationOfTwoNumbers(firstNumber: numberOne, secondNumber: numberTwo)
        
        // THEN
        XCTAssertEqual(result, 30, "Expected result to be 30")
    }
    
    func testDivide() {
        
        // Test case when divisor is not zero
          do {
              let result = try sut.divide(10, by: 2)
              XCTAssertEqual(result, 5, "Expected result to be 5")
          } catch {
              XCTFail("Test failed with unexpected error: \(error)")
          }
          
        // Test case when divisor is zero
          do {
              let _ = try sut.divide(10, by: 0)
              XCTFail("Test failed, expected error to be thrown")
          } catch DivisionError.divisionByZero {
              // Test passed, expected error was thrown
          } catch {
              XCTFail("Test failed with unexpected error: \(error)")
          }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
