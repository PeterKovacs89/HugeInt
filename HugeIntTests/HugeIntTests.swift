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
    func testZeroInitwithReturnsCorrectZeroValues() {
        
        let hugeInt = HugeInt(with: [0:HugeDigit(position: 0, value: 0)], isNegative:false)
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 0 && intValue.1 == "")
    }
    
    func testZeroInitWithIntReturnsCorrectZeroValues() {
        
        let hugeInt = HugeInt(with: (0, ""))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 0 && intValue.1 == "")
    }
    
    func testZeroInitWithDoubleReturnsCorrectZeroValues() {
        
        let hugeInt = HugeInt(with: (0.0, ""))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 0 && intValue.1 == "")
    }
    
    //MARK: - 0-999
    func testSub1000InitwithReturnsCorrectSub1000Values() {
        
        let hugeInt = HugeInt(with: [0:HugeDigit(position: 0, value: 999)], isNegative:false)
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "")
    }
    
    func testSub1000InitWithIntReturnsCorrectSub1000Values() {
        
        let hugeInt = HugeInt(with: (999, ""))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "")
    }
    
    func testSub1000InitWithDoubleReturnsCorrectSub1000Values() {
        
        let hugeInt = HugeInt(with: (999.0, ""))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "")
    }
    
    //MARK: - a-z
    func testAInitwithReturnsCorrectAValues() {
        
        let hugeInt = HugeInt(with: [1:HugeDigit(position: 1, value: 999)], isNegative:false)
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
    }
    
    func testAInitWithIntReturnsCorrectAValues() {
        
        let hugeInt = HugeInt(with: (999, "a"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
    }
    
    func testAInitWithDoubleReturnsCorrectAValues() {
        
        let hugeInt = HugeInt(with: (999.0, "a"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
    }
    
    func testAInitwithReturnsCorrectDecimalValues() {
        
        let hugeInt = HugeInt(with: [1:HugeDigit(position: 1, value: 999), 0:HugeDigit(position: 0, value: 900)], isNegative:false)
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
        
        let doubleValue = hugeInt.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 999.9 && doubleValue.1 == "a")
    }
    
    func testAInitWithDoubleReturnsCorrectDecimalValues() {
        
        let hugeInt = HugeInt(with: (999.9, "a"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "a")
        
        let doubleValue = hugeInt.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 999.9 && doubleValue.1 == "a")
    }
    
    func testZInitwithReturnsCorrectZValues() {
        
        let hugeInt = HugeInt(with: [26:HugeDigit(position: 26, value: 999)], isNegative:false)
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "z")
    }
    
    func testZInitWithIntReturnsCorrectZValues() {
        
        let hugeInt = HugeInt(with: (999, "z"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "z")
    }
    
    func testZInitWithDoubleReturnsCorrectZValues() {
        
        let hugeInt = HugeInt(with: (999.0, "z"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "z")
    }
    
    //MARK: - aa-zz
    func testAAInitwithReturnsCorrectAAValues() {
        
        let hugeInt = HugeInt(with: [1:HugeDigit(position: 27, value: 999)], isNegative:false)
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
    }
    
    func testAAInitWithIntReturnsCorrectAAValues() {
        
        let hugeInt = HugeInt(with: (999, "aa"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
    }
    
    func testAAInitWithDoubleReturnsCorrectAAValues() {
        
        let hugeInt = HugeInt(with: (999.0, "aa"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
    }
    
    func testAAInitwithReturnsCorrectDecimalValues() {
        
        let hugeInt = HugeInt(with: [27:HugeDigit(position: 27, value: 999), 26:HugeDigit(position: 26, value: 900)], isNegative:false)
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
        
        let doubleValue = hugeInt.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 999.9 && doubleValue.1 == "aa")
    }
    
    func testAAInitWithDoubleReturnsCorrectDecimalValues() {
        
        let hugeInt = HugeInt(with: (999.9, "aa"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "aa")
        
        let doubleValue = hugeInt.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 999.9 && doubleValue.1 == "aa")
    }
    
    func testZZInitwithReturnsCorrectZZValues() {
        
        let hugeInt = HugeInt(with: [702:HugeDigit(position: 702, value: 999)], isNegative:false)
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "zz")
    }
    
    func testAddingBelow1000WithDoubleTransmissionWith1And999A999() {
        
        let hugeIntA = HugeInt(with: (1, ""))
        let hugeIntB = HugeInt(with: (999, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 1 && intValue.1 == "a")
        
        let doubleValue = result.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 1.0 && doubleValue.1 == "a")
    }
    
    func testZZInitWithIntReturnsCorrectZZValues() {
        
        let hugeInt = HugeInt(with: (999, "zz"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "zz")
    }
    
    func testZZInitWithDoubleReturnsCorrectZZValues() {
        
        let hugeInt = HugeInt(with: (999.0, "zz"))
        
        let intValue = hugeInt.hugeIntValue
        
        XCTAssert(intValue.0 == 999 && intValue.1 == "zz")
    }
    
    //MARK: - Negative Numbers
    func testNegativeIntInitwith() {
        
        let hugeInt = HugeInt(with: [0:HugeDigit(position: 0, value: 1)], isNegative:true)
        
        XCTAssert(hugeInt.hugeIntValue.0 == -1)
    }
    
    func testNegativeDoubleInitwith() {
        
        let hugeInt = HugeInt(with: [0:HugeDigit(position: 0, value: 1)], isNegative:true)
        
        XCTAssert(hugeInt.hugeDoubleValue.0 == -1.0)
    }
    
    func testNegativeIntInitWithValue() {
        
        let hugeInt = HugeInt(with: (-5, ""))
        
        XCTAssert(hugeInt.hugeIntValue.0 == -5)
    }
    
    func testNegativeDoubleInitWithValue() {
        
        let hugeInt = HugeInt(with: (-5.0, ""))
        
        XCTAssert(hugeInt.hugeDoubleValue.0 == -5.0)
    }
    
    //MARK: - Adding
    func testAddingBelow1000WithoutTransmissionWith0And1() {
        
        let hugeIntA = HugeInt(with: (1, ""))
        let hugeIntB = HugeInt(with: (0, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 1 && intValue.1 == "")
    }
    
    func testAddingBelow1000WithoutTransmissionWith100And300() {
        
        let hugeIntA = HugeInt(with: (100, ""))
        let hugeIntB = HugeInt(with: (300, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 400 && intValue.1 == "")
    }
    
    func testAddingAbove1000WithoutTransmissionWith100AAnd300A() {
        
        let hugeIntA = HugeInt(with: (100, "a"))
        let hugeIntB = HugeInt(with: (300, "a"))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 400 && intValue.1 == "a")
    }
    
    func testAddingAbove1000WithoutTransmissionWith100AAnd300() {
        
        let hugeIntA = HugeInt(with: (100, "a"))
        let hugeIntB = HugeInt(with: (300, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 100 && intValue.1 == "a")
        
        let doubleValue = result.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 100.3 && doubleValue.1 == "a")
    }
    
    func testAddingAbove1000WithoutTransmissionWithDouble100AAnd300A() {
        
        let hugeIntA = HugeInt(with: (100.3, "a"))
        let hugeIntB = HugeInt(with: (300.3, "a"))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 400 && intValue.1 == "a")
        
        let doubleValue = result.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 400.6 && doubleValue.1 == "a")
    }
    
    func testAddingBelow1000WithTransmissionWith1And999() {
        
        let hugeIntA = HugeInt(with: (1, ""))
        let hugeIntB = HugeInt(with: (999, ""))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 1 && intValue.1 == "a")
        
        let doubleValue = result.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 1.0 && doubleValue.1 == "a")
    }
    
    func testAddingAbove1000WithTransmissionWithDouble100AAnd300A() {
        
        let hugeIntA = HugeInt(with: (100.5, "a"))
        let hugeIntB = HugeInt(with: (300.5, "a"))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 401 && intValue.1 == "a")
        
        let doubleValue = result.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 401.0 && doubleValue.1 == "a")
    }
    
    func testAddingAbove1000WithTransmissionWithDouble100AAnd950A() {
        
        let hugeIntA = HugeInt(with: (100.0, "a"))
        let hugeIntB = HugeInt(with: (950.0, "a"))
        
        let result = hugeIntA + hugeIntB
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 1 && intValue.1 == "b")
        
        let doubleValue = result.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 1.05 && doubleValue.1 == "b")
    }
    
    func testAddingAbove1000WithTransmissionWithDouble100CAnd950BAnd100A() {
        
        let hugeIntA = HugeInt(with: (100.0, "c"))
        let hugeIntB = HugeInt(with: (950.0, "b"))
        let hugeIntC = HugeInt(with: (100.0, "a"))
        
        let result = hugeIntA + hugeIntB + hugeIntC
        
        let intValue = result.hugeIntValue
        
        XCTAssert(intValue.0 == 100 && intValue.1 == "c")
        
        let doubleValue = result.hugeDoubleValue
        
        XCTAssert(doubleValue.0 == 100.95 && doubleValue.1 == "c")
    }
    
    func testAddingNegativeToPositiveWith2And2() {
        
        let hugeIntA = HugeInt(with: (2, ""))
        let hugeIntB = HugeInt(with: (-2, ""))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 0 && result.hugeIntValue.1 == "")
    }
    
    func testAddingNegativeToPositiveWith2And3() {
        
        let hugeIntA = HugeInt(with: (2, ""))
        let hugeIntB = HugeInt(with: (-3, ""))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == -1 && result.hugeIntValue.1 == "")
    }
    
    func testAddingNegativeToPositiveWith2AAnd3A() {
        
        let hugeIntA = HugeInt(with: (2, "a"))
        let hugeIntB = HugeInt(with: (-3, "a"))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == -1 && result.hugeIntValue.1 == "a")
    }
    
    func testAddingNegativeToNegativeeWith2AAnd3A() {
        
        let hugeIntA = HugeInt(with: (-2, "a"))
        let hugeIntB = HugeInt(with: (-3, "a"))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == -5 && result.hugeIntValue.1 == "a")
    }
    
    func testAddingPositiveToNegativeWith2AAnd3A() {
        
        let hugeIntA = HugeInt(with: (-2, "a"))
        let hugeIntB = HugeInt(with: (3, "a"))
        
        let result = hugeIntA + hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 1 && result.hugeIntValue.1 == "a")
    }
    
    //MARK: - Subtraction
    
    func testSubtractingPositiveToPositiveWith2AAnd3A() {
        
        let hugeIntA = HugeInt(with: (2, "a"))
        let hugeIntB = HugeInt(with: (3, "a"))
        
        let result = hugeIntA - hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == -1 && result.hugeIntValue.1 == "a")
    }
    
    func testSubtractingNegativeToPositiveWith2AAnd3A() {
        
        let hugeIntA = HugeInt(with: (2, "a"))
        let hugeIntB = HugeInt(with: (-3, "a"))
        
        let result = hugeIntA - hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 5 && result.hugeIntValue.1 == "a")
    }
    
    func testSubtractingPositiveToNegativeWith2AAnd3A() {
        
        let hugeIntA = HugeInt(with: (-2, "a"))
        let hugeIntB = HugeInt(with: (3, "a"))
        
        let result = hugeIntA - hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == -5 && result.hugeIntValue.1 == "a")
    }
    
    func testSubtractingNegativeToNegativeWith2AAnd3A() {
        
        let hugeIntA = HugeInt(with: (-2, "a"))
        let hugeIntB = HugeInt(with: (-3, "a"))
        
        let result = hugeIntA - hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 1 && result.hugeIntValue.1 == "a")
    }
    
    //MARK: - Multiplication
    func testMultiplicationPositiveToPositiveWith2AAnd3A() {
        
        let hugeIntA = HugeInt(with: (2, "a"))
        let hugeIntB = HugeInt(with: (3, "a"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 6 && result.hugeIntValue.1 == "b")
    }
    
    func testMultiplicationPositiveToPositiveWith2AAnd3() {
        
        let hugeIntA = HugeInt(with: (2, "a"))
        let hugeIntB = HugeInt(with: (3, ""))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 6 && result.hugeIntValue.1 == "a")
    }
    
    func testMultiplicationPositiveToPositiveWith2AAnd0() {
        
        let hugeIntA = HugeInt(with: (2, "a"))
        let hugeIntB = HugeInt(with: (0, ""))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 0 && result.hugeIntValue.1 == "")
    }
    
    func testMultiplicationPositiveToPositiveWith2And2A() {
        
        let hugeIntA = HugeInt(with: (2, "a"))
        let hugeIntB = HugeInt(with: (2, "a"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 4 && result.hugeIntValue.1 == "b")
    }
    
    func testMultiplicationPositiveToPositiveWith2Bnd2B() {
        
        let hugeIntA = HugeInt(with: (2, "b"))
        let hugeIntB = HugeInt(with: (2, "b"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 4 && result.hugeIntValue.1 == "d")
    }
    
    func testMultiplicationPositiveToNegativeWith2Bnd2B() {
        
        let hugeIntA = HugeInt(with: (-2, "b"))
        let hugeIntB = HugeInt(with: (2, "b"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == -4 && result.hugeIntValue.1 == "d" && result.isNegative == true)
    }
    
    func testMultiplicationNegativeToPositiveWith2Bnd2B() {
        
        let hugeIntA = HugeInt(with: (2, "b"))
        let hugeIntB = HugeInt(with: (-2, "b"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == -4 && result.hugeIntValue.1 == "d" && result.isNegative == true)
    }
    
    func testMultiplicationNegativeToNegativeWith2Bnd2B() {
        
        let hugeIntA = HugeInt(with: (-2, "b"))
        let hugeIntB = HugeInt(with: (-2, "b"))
        
        let result = hugeIntA * hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 4 && result.hugeIntValue.1 == "d" && result.isNegative == false)
    }
    
    //Division
    func testDivisionPositiveByPositive1EWith1() {
        
        let hugeIntA = HugeInt(with: (1, "e"))
        let hugeIntB = HugeInt(with: (1, ""))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 1 && result.hugeIntValue.1 == "e" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith1A() {
        
        let hugeIntA = HugeInt(with: (1, "e"))
        let hugeIntB = HugeInt(with: (1, "a"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 1 && result.hugeIntValue.1 == "d" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith1B() {
        
        let hugeIntA = HugeInt(with: (1, "e"))
        let hugeIntB = HugeInt(with: (1, "b"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 1 && result.hugeIntValue.1 == "c" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith1E() {
        
        let hugeIntA = HugeInt(with: (1, "e"))
        let hugeIntB = HugeInt(with: (1, "e"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 1 && result.hugeIntValue.1 == "" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith1F() {
        
        let hugeIntA = HugeInt(with: (1, "e"))
        let hugeIntB = HugeInt(with: (1, "f"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 0 && result.hugeIntValue.1 == "" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith2() {
        
        let hugeIntA = HugeInt(with: (1, "e"))
        let hugeIntB = HugeInt(with: (2, ""))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 500 && result.hugeIntValue.1 == "d" && result.isNegative == false)
    }
    
    func testDivisionPositiveByPositive1EWith2A() {
        
        let hugeIntA = HugeInt(with: (1, "e"))
        let hugeIntB = HugeInt(with: (2, "a"))
        
        let result = hugeIntA / hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 500 && result.hugeIntValue.1 == "c" && result.isNegative == false)
    }
    
    func testDivisionQuotientPositiveByPositive1EWith2A() {
        
        let hugeIntA = HugeInt(with: (100, "e"))
        let hugeIntB = HugeInt(with: (30, "e"))
        
        let result = hugeIntA % hugeIntB
        
        XCTAssert(result.hugeIntValue.0 == 10 && result.hugeIntValue.1 == "e" && result.isNegative == false)
    }
 
    //shifting
    func testLeftShifting2With2() {
        let hugeIntA = HugeInt(with: (2, ""))
        
        let result = hugeIntA << 2
        
        XCTAssert(result.hugeIntValue.0 == 2 && result.hugeIntValue.1 == "b" && result.isNegative == false)
    }
    
    func testLeftShifting2With5() {
        let hugeIntA = HugeInt(with: (2, ""))
        
        let result = hugeIntA << 5
        
        XCTAssert(result.hugeIntValue.0 == 2 && result.hugeIntValue.1 == "e" && result.isNegative == false)
    }
    
    func testLeftShifting2AWith2() {
        let hugeIntA = HugeInt(with: (2, "a"))
        
        let result = hugeIntA << 2
        
        XCTAssert(result.hugeIntValue.0 == 2 && result.hugeIntValue.1 == "c" && result.isNegative == false)
    }
    
    func testLeftShifting2AWith0() {
        let hugeIntA = HugeInt(with: (2, "a"))
        
        let result = hugeIntA << 0
        
        XCTAssert(result.hugeIntValue.0 == 2 && result.hugeIntValue.1 == "a" && result.isNegative == false)
    }
    
    func testRightShifting2With2() {
        let hugeIntA = HugeInt(with: (2, ""))
        
        let result = hugeIntA >> 2
        
        XCTAssert(result.hugeIntValue.0 == 0 && result.hugeIntValue.1 == "" && result.isNegative == false)
    }
    
    func testRightShifting2With5() {
        let hugeIntA = HugeInt(with: (2, ""))
        
        let result = hugeIntA >> 5
        
        XCTAssert(result.hugeIntValue.0 == 0 && result.hugeIntValue.1 == "" && result.isNegative == false)
    }
    
    func testRightShifting2AWith1() {
        let hugeIntA = HugeInt(with: (2, "a"))
        
        let result = hugeIntA >> 1
        
        XCTAssert(result.hugeIntValue.0 == 2 && result.hugeIntValue.1 == "" && result.isNegative == false)
    }
    
    func testRightShifting2AWith0() {
        let hugeIntA = HugeInt(with: (2, "a"))
        
        let result = hugeIntA >> 0
        
        XCTAssert(result.hugeIntValue.0 == 2 && result.hugeIntValue.1 == "a" && result.isNegative == false)
    }
    
    //Power
    func testPowerWith2AExponent0() {
        let hugeIntA = HugeInt(with: (2, "a"))
        
        let result = hugeIntA.power(0)
        
        XCTAssert(result.hugeIntValue.0 == 1 && result.hugeIntValue.1 == "" && result.isNegative == false)
    }
    
    func testPowerWith2AExponent1() {
        let hugeIntA = HugeInt(with: (2, "a"))
        
        let result = hugeIntA.power(1)
        
        XCTAssert(result.hugeIntValue.0 == 2 && result.hugeIntValue.1 == "a" && result.isNegative == false)
    }
    
    func testPowerWith2AExponent2() {
        let hugeIntA = HugeInt(with: (2, "a"))
        
        let result = hugeIntA.power(2)
        
        XCTAssert(result.hugeIntValue.0 == 4 && result.hugeIntValue.1 == "b" && result.isNegative == false)
    }
    
    func testPowerWith2AExponent10() {
        let hugeIntA = HugeInt(with: (2, "a"))
        
        let result = hugeIntA.power(10)
        
        XCTAssert(result.hugeIntValue.0 == 1 && result.hugeIntValue.1 == "k" && result.isNegative == false)
    }
    
    func testPowerWith2Exponent1A() {
        let hugeIntA = HugeInt(with: (2, ""))
        
        let result = hugeIntA.power((1, "a"))
        
        XCTAssert(result.hugeIntValue.0 == 10 && result.hugeIntValue.1 == "cv" && result.isNegative == false)
    }
    
    func testPowerWith1Exponent1A() {
        let hugeIntA = HugeInt(with: (1, ""))
        
        let result = hugeIntA.power((1, "a"))
        
        XCTAssert(result.hugeIntValue.0 == 1 && result.hugeIntValue.1 == "" && result.isNegative == false)
    }
}

// Decimal String
extension HugeIntTests {
    
    func testDecimalStringWith1A() {
        let hugeIntA = HugeInt(with: (1, "a"))
        
        let result = hugeIntA.decimalString
        
        XCTAssert(result == "1,000")
    }
    
    func testDecimalStringWith10B() {
        let hugeIntA = HugeInt(with: (10, "b"))
        
        let result = hugeIntA.decimalString
        
        XCTAssert(result == "10,000,000")
    }
    
    func testDecimalStringWith10B1() {
        let hugeIntA = HugeInt(with: [2:HugeDigit(position: 2, value: 10), 0:HugeDigit(position: 0, value: 1)], isNegative: false)
        
        let result = hugeIntA.decimalString
        
        XCTAssert(result == "10,000,001")
    }
    
    func testDecimalStringWithMinus10B1() {
        let hugeIntA = HugeInt(with: [2:HugeDigit(position: 2, value: 10), 0:HugeDigit(position: 0, value: 1)], isNegative: true)
        
        let result = hugeIntA.decimalString
        
        XCTAssert(result == "-10,000,001")
    }
    
}
