//
//  HugeIntTests.shift
//  HugeIntTests
//
//  Created by PeterKovacs on 2018. 02. 02..
//  Copyright © 2018. KP. All rights reserved.
//

import XCTest

class HugeIntTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: - Zero
    func testZeroInitWithDigitsReturnsCorrectZeroValues() {
        
        let hugeInt = HugeInt(withDigits: [0:HugeDigit(position: 0, value: 0)], isNegative:false)
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 0 && intValue.1 == "")
    }
    
    func testZeroInitWithIntReturnsCorrectZeroValues() {
        
        let hugeInt = HugeInt(withIntValue: (0, ""))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 0 && intValue.1 == "")
    }
    
    func testZeroInitWithDoubleReturnsCorrectZeroValues() {
        
        let hugeInt = HugeInt(withDoubleValue: (0.0, ""))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 0 && intValue.1 == "")
    }
    
    //MARK: - 0-999
    func testSub1000InitWithDigitsReturnsCorrectSub1000Values() {
        
        let hugeInt = HugeInt(withDigits: [0:HugeDigit(position: 0, value: 999)], isNegative:false)
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "")
    }
    
    func testSub1000InitWithIntReturnsCorrectSub1000Values() {
        
        let hugeInt = HugeInt(withIntValue: (999, ""))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "")
    }
    
    func testSub1000InitWithDoubleReturnsCorrectSub1000Values() {
        
        let hugeInt = HugeInt(withDoubleValue: (999.0, ""))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "")
    }
    
    //MARK: - a-z
    func testAInitWithDigitsReturnsCorrectAValues() {
        
        let hugeInt = HugeInt(withDigits: [1:HugeDigit(position: 1, value: 999)], isNegative:false)
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
    }
    
    func testAInitWithIntReturnsCorrectAValues() {
        
        let hugeInt = HugeInt(withIntValue: (999, "a"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
    }
    
    func testAInitWithDoubleReturnsCorrectAValues() {
        
        let hugeInt = HugeInt(withDoubleValue: (999.0, "a"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
    }
    
    func testAInitWithDigitsReturnsCorrectDecimalValues() {
        
        let hugeInt = HugeInt(withDigits: [1:HugeDigit(position: 1, value: 999), 0:HugeDigit(position: 0, value: 900)], isNegative:false)
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
        
        let doubleValue = hugeInt.doubleValue
        
        XCTAssert(doubleValue.0 == 999.9 && doubleValue.1 == "a")
    }
    
    func testAInitWithDoubleReturnsCorrectDecimalValues() {
        
        let hugeInt = HugeInt(withDoubleValue: (999.9, "a"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
        
        let doubleValue = hugeInt.doubleValue
        
        XCTAssert(doubleValue.0 == 999.9 && doubleValue.1 == "a")
    }
    
    func testZInitWithDigitsReturnsCorrectZValues() {
        
        let hugeInt = HugeInt(withDigits: [26:HugeDigit(position: 26, value: 999)], isNegative:false)
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "z")
    }
    
    func testZInitWithIntReturnsCorrectZValues() {
        
        let hugeInt = HugeInt(withIntValue: (999, "z"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "z")
    }
    
    func testZInitWithDoubleReturnsCorrectZValues() {
        
        let hugeInt = HugeInt(withDoubleValue: (999.0, "z"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "z")
    }
    
    //MARK: - aa-zz
    func testAAInitWithDigitsReturnsCorrectAAValues() {
        
        let hugeInt = HugeInt(withDigits: [1:HugeDigit(position: 27, value: 999)], isNegative:false)
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
    }
    
    func testAAInitWithIntReturnsCorrectAAValues() {
        
        let hugeInt = HugeInt(withIntValue: (999, "aa"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
    }
    
    func testAAInitWithDoubleReturnsCorrectAAValues() {
        
        let hugeInt = HugeInt(withDoubleValue: (999.0, "aa"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
    }
    
    func testAAInitWithDigitsReturnsCorrectDecimalValues() {
        
        let hugeInt = HugeInt(withDigits: [27:HugeDigit(position: 27, value: 999), 26:HugeDigit(position: 26, value: 900)], isNegative:false)
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
        
        let doubleValue = hugeInt.doubleValue
        
        XCTAssert(doubleValue.0 == 999.9 && doubleValue.1 == "aa")
    }
    
    func testAAInitWithDoubleReturnsCorrectDecimalValues() {
        
        let hugeInt = HugeInt(withDoubleValue: (999.9, "aa"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
        
        let doubleValue = hugeInt.doubleValue
        
        XCTAssert(doubleValue.0 == 999.9 && doubleValue.1 == "aa")
    }
    
    func testZZInitWithDigitsReturnsCorrectZZValues() {
        
        let hugeInt = HugeInt(withDigits: [702:HugeDigit(position: 702, value: 999)], isNegative:false)
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "zz")
    }
    
    func testAddingBelow1000WithDoubleTransmissionWith1And999A999() {
        
        let hugeIntA = HugeInt(withDoubleValue: (1, ""))
        let hugeIntB = HugeInt(withDoubleValue: (999, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 1 && intValue.1 == "a")
        
        let doubleValue = result.doubleValue
        
        XCTAssert(doubleValue.0 == 1.0 && doubleValue.1 == "a")
    }
    
    func testZZInitWithIntReturnsCorrectZZValues() {
        
        let hugeInt = HugeInt(withIntValue: (999, "zz"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "zz")
    }
    
    func testZZInitWithDoubleReturnsCorrectZZValues() {
        
        let hugeInt = HugeInt(withDoubleValue: (999.0, "zz"))
        
        let intValue = hugeInt.intValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "zz")
    }
    
    //MARK: - Negative Numbers
    func testNegativeIntInitWithDigits() {
        
        let hugeInt = HugeInt(withDigits: [0:HugeDigit(position: 0, value: 1)], isNegative:true)
        
        XCTAssert(hugeInt.intValue.0 == -1)
    }
    
    func testNegativeDoubleInitWithDigits() {
        
        let hugeInt = HugeInt(withDigits: [0:HugeDigit(position: 0, value: 1)], isNegative:true)
        
        XCTAssert(hugeInt.doubleValue.0 == -1.0)
    }
    
    func testNegativeIntInitWithValue() {
        
        let hugeInt = HugeInt(withIntValue: (-5, ""))
        
        XCTAssert(hugeInt.intValue.0 == -5)
    }
    
    func testNegativeDoubleInitWithValue() {
        
        let hugeInt = HugeInt(withDoubleValue: (-5.0, ""))
        
        XCTAssert(hugeInt.doubleValue.0 == -5.0)
    }
    
    //MARK: - Adding
    func testAddingBelow1000WithoutTransmissionWith0And1() {
        
        let hugeIntA = HugeInt(withIntValue: (1, ""))
        let hugeIntB = HugeInt(withIntValue: (0, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 1 && intValue.1 == "")
    }
    
    func testAddingBelow1000WithoutTransmissionWith100And300() {
        
        let hugeIntA = HugeInt(withIntValue: (100, ""))
        let hugeIntB = HugeInt(withIntValue: (300, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 400 && intValue.1 == "")
    }
    
    func testAddingAbove1000WithoutTransmissionWith100AAnd300A() {
        
        let hugeIntA = HugeInt(withIntValue: (100, "a"))
        let hugeIntB = HugeInt(withIntValue: (300, "a"))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 400 && intValue.1 == "a")
    }
    
    func testAddingAbove1000WithoutTransmissionWith100AAnd300() {
        
        let hugeIntA = HugeInt(withIntValue: (100, "a"))
        let hugeIntB = HugeInt(withIntValue: (300, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 100 && intValue.1 == "a")
        
        let doubleValue = result.doubleValue
        
        XCTAssert(doubleValue.0 == 100.3 && doubleValue.1 == "a")
    }
    
    func testAddingAbove1000WithoutTransmissionWithDouble100AAnd300A() {
        
        let hugeIntA = HugeInt(withDoubleValue: (100.3, "a"))
        let hugeIntB = HugeInt(withDoubleValue: (300.3, "a"))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 400 && intValue.1 == "a")
        
        let doubleValue = result.doubleValue
        
        XCTAssert(doubleValue.0 == 400.6 && doubleValue.1 == "a")
    }
    
    func testAddingBelow1000WithTransmissionWith1And999() {
        
        let hugeIntA = HugeInt(withDoubleValue: (1, ""))
        let hugeIntB = HugeInt(withDoubleValue: (999, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 1 && intValue.1 == "a")
        
        let doubleValue = result.doubleValue
        
        XCTAssert(doubleValue.0 == 1.0 && doubleValue.1 == "a")
    }
    
    func testAddingAbove1000WithTransmissionWithDouble100AAnd300A() {
        
        let hugeIntA = HugeInt(withDoubleValue: (100.5, "a"))
        let hugeIntB = HugeInt(withDoubleValue: (300.5, "a"))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 401 && intValue.1 == "a")
        
        let doubleValue = result.doubleValue
        
        XCTAssert(doubleValue.0 == 401.0 && doubleValue.1 == "a")
    }
    
    func testAddingAbove1000WithTransmissionWithDouble100AAnd950A() {
        
        let hugeIntA = HugeInt(withDoubleValue: (100.0, "a"))
        let hugeIntB = HugeInt(withDoubleValue: (950.0, "a"))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 1 && intValue.1 == "b")
        
        let doubleValue = result.doubleValue
        
        XCTAssert(doubleValue.0 == 1.05 && doubleValue.1 == "b")
    }
    
    func testAddingAbove1000WithTransmissionWithDouble100CAnd950BAnd100A() {
        
        let hugeIntA = HugeInt(withDoubleValue: (100.0, "c"))
        let hugeIntB = HugeInt(withDoubleValue: (950.0, "b"))
        let hugeIntC = HugeInt(withDoubleValue: (100.0, "a"))
        
        let result = hugeIntA + hugeIntB + hugeIntC
        
        let intValue = result.intValue
        
        XCTAssert(intValue.0 == 100 && intValue.1 == "c")
        
        let doubleValue = result.doubleValue
        
        XCTAssert(doubleValue.0 == 100.95 && doubleValue.1 == "c")
    }
    
    func testAddingNegativeToPositiveWith2And2() {
        
        let hugeIntA = HugeInt(withIntValue: (2, ""))
        let hugeIntB = HugeInt(withIntValue: (-2, ""))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.intValue.0 == 0 && result.intValue.1 == "")
    }
    
    func testAddingNegativeToPositiveWith2And3() {
        
        let hugeIntA = HugeInt(withIntValue: (2, ""))
        let hugeIntB = HugeInt(withIntValue: (-3, ""))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.intValue.0 == -1 && result.intValue.1 == "")
    }
    
    func testAddingNegativeToPositiveWith2AAnd3A() {
        
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        let hugeIntB = HugeInt(withIntValue: (-3, "a"))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.intValue.0 == -1 && result.intValue.1 == "a")
    }
    
    func testAddingNegativeToNegativeeWith2AAnd3A() {
        
        let hugeIntA = HugeInt(withIntValue: (-2, "a"))
        let hugeIntB = HugeInt(withIntValue: (-3, "a"))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.intValue.0 == -5 && result.intValue.1 == "a")
    }
    
    func testAddingPositiveToNegativeWith2AAnd3A() {
        
        let hugeIntA = HugeInt(withIntValue: (-2, "a"))
        let hugeIntB = HugeInt(withIntValue: (3, "a"))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.intValue.0 == 1 && result.intValue.1 == "a")
    }
    
    //MARK: - Subtraction
    
    func testSubtractingPositiveToPositiveWith2AAnd3A() {
        
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        let hugeIntB = HugeInt(withIntValue: (3, "a"))
        
        let result = hugeIntA - hugeIntB
        
        XCTAssert(result.intValue.0 == -1 && result.intValue.1 == "a")
    }
    
    func testSubtractingNegativeToPositiveWith2AAnd3A() {
        
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        let hugeIntB = HugeInt(withIntValue: (-3, "a"))
        
        let result = hugeIntA - hugeIntB
        
        XCTAssert(result.intValue.0 == 5 && result.intValue.1 == "a")
    }
    
    func testSubtractingPositiveToNegativeWith2AAnd3A() {
        
        let hugeIntA = HugeInt(withIntValue: (-2, "a"))
        let hugeIntB = HugeInt(withIntValue: (3, "a"))
        
        let result = hugeIntA - hugeIntB
        
        XCTAssert(result.intValue.0 == -5 && result.intValue.1 == "a")
    }
    
    func testSubtractingNegativeToNegativeWith2AAnd3A() {
        
        let hugeIntA = HugeInt(withIntValue: (-2, "a"))
        let hugeIntB = HugeInt(withIntValue: (-3, "a"))
        
        let result = hugeIntA - hugeIntB
        
        XCTAssert(result.intValue.0 == 1 && result.intValue.1 == "a")
    }
    
    //MARK: - Multiplication
    func testMultiplicationPositiveToPositiveWith2AAnd3A() {
        
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        let hugeIntB = HugeInt(withIntValue: (3, "a"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.intValue.0 == 6 && result.intValue.1 == "b")
    }
    
    func testMultiplicationPositiveToPositiveWith2AAnd3() {
        
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        let hugeIntB = HugeInt(withIntValue: (3, ""))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.intValue.0 == 6 && result.intValue.1 == "a")
    }
    
    func testMultiplicationPositiveToPositiveWith2AAnd0() {
        
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        let hugeIntB = HugeInt(withIntValue: (0, ""))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.intValue.0 == 0 && result.intValue.1 == "")
    }
    
    func testMultiplicationPositiveToPositiveWith2And2A() {
        
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        let hugeIntB = HugeInt(withIntValue: (2, "a"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.intValue.0 == 4 && result.intValue.1 == "b")
    }
    
    func testMultiplicationPositiveToPositiveWith2Bnd2B() {
        
        let hugeIntA = HugeInt(withIntValue: (2, "b"))
        let hugeIntB = HugeInt(withIntValue: (2, "b"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.intValue.0 == 4 && result.intValue.1 == "d")
    }
    
    func testMultiplicationPositiveToNegativeWith2Bnd2B() {
        
        let hugeIntA = HugeInt(withIntValue: (-2, "b"))
        let hugeIntB = HugeInt(withIntValue: (2, "b"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.intValue.0 == -4 && result.intValue.1 == "d" && result.isNegative == true)
    }
    
    func testMultiplicationNegativeToPositiveWith2Bnd2B() {
        
        let hugeIntA = HugeInt(withIntValue: (2, "b"))
        let hugeIntB = HugeInt(withIntValue: (-2, "b"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.intValue.0 == -4 && result.intValue.1 == "d" && result.isNegative == true)
    }
    
    func testMultiplicationNegativeToNegativeWith2Bnd2B() {
        
        let hugeIntA = HugeInt(withIntValue: (-2, "b"))
        let hugeIntB = HugeInt(withIntValue: (-2, "b"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.intValue.0 == 4 && result.intValue.1 == "d" && result.isNegative == false)
    }
    
    //Division
    func testDivisionPositiveByPositive1EWith1() {
        
        let hugeIntA = HugeInt(withIntValue: (1, "e"))
        let hugeIntB = HugeInt(withIntValue: (1, ""))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.intValue.0 == 1 && result.intValue.1 == "e" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith1A() {
        
        let hugeIntA = HugeInt(withIntValue: (1, "e"))
        let hugeIntB = HugeInt(withIntValue: (1, "a"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.intValue.0 == 1 && result.intValue.1 == "d" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith1B() {
        
        let hugeIntA = HugeInt(withIntValue: (1, "e"))
        let hugeIntB = HugeInt(withIntValue: (1, "b"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.intValue.0 == 1 && result.intValue.1 == "c" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith1E() {
        
        let hugeIntA = HugeInt(withIntValue: (1, "e"))
        let hugeIntB = HugeInt(withIntValue: (1, "e"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.intValue.0 == 1 && result.intValue.1 == "" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith1F() {
        
        let hugeIntA = HugeInt(withIntValue: (1, "e"))
        let hugeIntB = HugeInt(withIntValue: (1, "f"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.intValue.0 == 0 && result.intValue.1 == "" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith2() {
        
        let hugeIntA = HugeInt(withIntValue: (1, "e"))
        let hugeIntB = HugeInt(withIntValue: (2, ""))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.intValue.0 == 500 && result.intValue.1 == "d" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith2A() {
        
        let hugeIntA = HugeInt(withIntValue: (1, "e"))
        let hugeIntB = HugeInt(withIntValue: (2, "a"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.intValue.0 == 500 && result.intValue.1 == "c" && result.isNegative == false)
    }
    
    func testDivisionQuotientPositiveByPositive1EWith2A() {
        
        let hugeIntA = HugeInt(withIntValue: (100, "e"))
        let hugeIntB = HugeInt(withIntValue: (30, "e"))
        
        let result = hugeIntA % hugeIntB
        
        XCTAssert(result.intValue.0 == 10 && result.intValue.1 == "e" && result.isNegative == false)
    }
 
    //shifting
    func testLeftShifting2With2() {
        let hugeIntA = HugeInt(withIntValue: (2, ""))
        
        let result = hugeIntA << 2
        
        XCTAssert(result.intValue.0 == 2 && result.intValue.1 == "b" && result.isNegative == false)
    }
    
    func testLeftShifting2With5() {
        let hugeIntA = HugeInt(withIntValue: (2, ""))
        
        let result = hugeIntA << 5
        
        XCTAssert(result.intValue.0 == 2 && result.intValue.1 == "e" && result.isNegative == false)
    }
    
    func testLeftShifting2AWith2() {
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        
        let result = hugeIntA << 2
        
        XCTAssert(result.intValue.0 == 2 && result.intValue.1 == "c" && result.isNegative == false)
    }
    
    func testLeftShifting2AWith0() {
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        
        let result = hugeIntA << 0
        
        XCTAssert(result.intValue.0 == 2 && result.intValue.1 == "a" && result.isNegative == false)
    }
    
    func testRightShifting2With2() {
        let hugeIntA = HugeInt(withIntValue: (2, ""))
        
        let result = hugeIntA >> 2
        
        XCTAssert(result.intValue.0 == 0 && result.intValue.1 == "" && result.isNegative == false)
    }
    
    func testRightShifting2With5() {
        let hugeIntA = HugeInt(withIntValue: (2, ""))
        
        let result = hugeIntA >> 5
        
        XCTAssert(result.intValue.0 == 0 && result.intValue.1 == "" && result.isNegative == false)
    }
    
    func testRightShifting2AWith1() {
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        
        let result = hugeIntA >> 1
        
        XCTAssert(result.intValue.0 == 2 && result.intValue.1 == "" && result.isNegative == false)
    }
    
    func testRightShifting2AWith0() {
        let hugeIntA = HugeInt(withIntValue: (2, "a"))
        
        let result = hugeIntA >> 0
        
        XCTAssert(result.intValue.0 == 2 && result.intValue.1 == "a" && result.isNegative == false)
    }
}
