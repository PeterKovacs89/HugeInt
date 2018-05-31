//
//  HugeDigitTest.swift
//  HugeIntTests
//
//  Created by PeterKovacs on 2018. 02. 06..
//  Copyright © 2018. KP. All rights reserved.
//

import XCTest

class HugeDigitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: - String Tests
    
    func compare(position:Int, withString:String)
    {
        let digit = HugeDigit(position: position, value: 0)
        
        let stringValue = digit.stringForPosition()
        
        XCTAssert(stringValue == withString, "\(position)'s string value should be \(withString)")
    }
    
    func testStringForPositionWith0ValueReturnsEmptyString() {
        
        let digit = HugeDigit(position: 0, value: 0)
        
        let stringValue = digit.stringForPosition()
        
        XCTAssert(stringValue == "", "Zero value is not equal to empty string")
    }
    
    func testStringForPositionWith999ValueReturnsEmptyString() {
        
        let digit = HugeDigit(position: 0, value: 999)
        
        let stringValue = digit.stringForPosition()
        
        XCTAssert(stringValue == "", "Less than 1000 value is not equal to empty string")
    }
    
    func testStringForPositionWithPosition1ReturnsA() {
        
        self.compare(position: 1, withString: "a")
    }
    
    func testStringForPositionWithPosition2ReturnsB() {
        
        self.compare(position: 2, withString: "b")
    }
    
    func testStringForPositionWithPosition26ReturnsZ() {
        
        self.compare(position: 26, withString: "z")
    }
    
    func testStringForPositionWithPosition27ReturnsAA() {
        
        self.compare(position: 27, withString: "aa")
    }
    
    func testStringForPositionWithPosition28ReturnsAB() {
        
        self.compare(position: 28, withString: "ab")
    }
    
    func testStringForPositionWithPosition52ReturnsAZ() {
        
        self.compare(position: 52, withString: "az")
    }
    
    func testStringForPositionWithPosition53ReturnsBA() {
        
        self.compare(position: 53, withString: "ba")
    }
    
    func testStringForPositionWithPosition702ReturnsZZ() {
        
        self.compare(position: 702, withString: "zz")
    }
    
    func testStringForPositionWithPosition6776ReturnsAAA() {
        
        self.compare(position: 703, withString: "aaa")
    }
    
    //MARK: - Position Tests
    func compare(string:String, withPosition:Int)
    {
        let digit = HugeDigit(with: string, value: 0)
        
        XCTAssert(digit.position == withPosition, "\(string)'s position should be \(withPosition)")
    }
    
    func testPositionStringWithEmptyStringReturns0Position() {
        
        self.compare(string: "", withPosition: 0)
    }
    
    func testPositionStringWithAReturns1Position() {
        
        self.compare(string: "a", withPosition: 1)
    }
    
    func testPositionStringWithBReturns2Position() {
        
        self.compare(string: "b", withPosition: 2)
    }
    
    func testPositionStringWithZReturns26Position() {
        
        self.compare(string: "z", withPosition: 26)
    }
    
    func testPositionStringWithAAReturns27Position() {
        
        self.compare(string: "aa", withPosition: 27)
    }
    
    func testPositionStringWithABReturns28Position() {
        
        self.compare(string: "ab", withPosition: 28)
    }
    
    func testPositionStringWithAZReturns52Position() {
        
        self.compare(string: "az", withPosition: 52)
    }
    
    func testPositionStringWithBAReturns53Position() {
        
        self.compare(string: "ba", withPosition: 53)
    }
    
    func testPositionStringWithZZReturns702Position() {
        
        self.compare(string: "zz", withPosition: 702)
    }
    
    func testPositionStringWithAAAReturns703Position() {
        
        self.compare(string: "aaa", withPosition: 703)
    }
}

//MARK: - Comparsion
extension HugeDigitTests {
    
    //MARK: - Equal
    func test0IsEqualTo0ReturnsTrue() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 0)
        
        let result = digitA == digitB
        
        XCTAssertTrue(result)
    }
    
    func test0IsEqualTo1ReturnsFalse() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 1)
        
        let result = digitA == digitB
        
        XCTAssertFalse(result)
    }
    
    func testAIsEqualTo0ReturnsFalse() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 1, value: 0)
        
        let result = digitA == digitB
        
        XCTAssertFalse(result)
    }
    
    //MARK: - Less
    func testComparsionLessWith0And0ReturnsFalse() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 0)
        
        let result = digitA < digitB
        
        XCTAssertFalse(result)
    }
    
    func testComparsionLessWith0And1ReturnsTrue() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 1)
        
        let result = digitA < digitB
        
        XCTAssertTrue(result)
    }
    
    func testComparsionLessWith1AndAReturnsTrue() {
        
        let digitA = HugeDigit(position: 0, value: 1)
        let digitB = HugeDigit(position: 1, value: 0)
        
        let result = digitA < digitB
        
        XCTAssertTrue(result)
    }
    
    //MARK: - Less Or Equal
    func testComparsionLessOrEqualWith0And0ReturnsTrue() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 0)
        
        let result = digitA <= digitB
        
        XCTAssertTrue(result)
    }
    
    func testComparsionLessOrEqualWith0And1ReturnsTrue() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 1)
        
        let result = digitA <= digitB
        
        XCTAssertTrue(result)
    }
    
    func testComparsionLessOrEqualWith1And0ReturnsFalse() {
        
        let digitA = HugeDigit(position: 0, value: 1)
        let digitB = HugeDigit(position: 0, value: 0)
        
        let result = digitA <= digitB
        
        XCTAssertFalse(result)
    }
    
    
    //MARK: - More
    func testComparsionMoreWith0And0ReturnsFalse() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 0)
        
        let result = digitA > digitB
        
        XCTAssertFalse(result)
    }
    
    func testComparsionMoreWith0And1ReturnsFalse() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 1)
        
        let result = digitA > digitB
        
        XCTAssertFalse(result)
    }
    
    func testComparsionMoreWith1And0ReturnsTrue() {
        
        let digitA = HugeDigit(position: 0, value: 1)
        let digitB = HugeDigit(position: 0, value: 0)
        
        let result = digitA > digitB
        
        XCTAssertTrue(result)
    }
    
    
    //MARK: - More Or Equal
    func testComparsionMoreOrEqualWith0And0ReturnsTrue() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 0)
        
        let result = digitA >= digitB
        
        XCTAssertTrue(result)
    }
    
    func testComparsionMoreOrEqualWith0And1ReturnsFalse() {
        
        let digitA = HugeDigit(position: 0, value: 0)
        let digitB = HugeDigit(position: 0, value: 1)
        
        let result = digitA >= digitB
        
        XCTAssertFalse(result)
    }
    
    func testComparsionMoreOrEqualWith1And0ReturnsTrue() {
        
        let digitA = HugeDigit(position: 0, value: 1)
        let digitB = HugeDigit(position: 0, value: 0)
        
        let result = digitA >= digitB
        
        XCTAssertTrue(result)
    }
}
