//
//  HugeInt.swift
//  HugeInt
//
//  Created by PeterKovacs on 2018. 02. 02..
//  Copyright © 2018. KP. All rights reserved.
//

import Foundation

public typealias HugeIntValue = (Int, String)
public typealias HugeDoubleValue = (Double, String)

public class HugeInt
{
    fileprivate var digits: [Int:HugeDigit] = [Int:HugeDigit]()
    
    fileprivate var negativeScalar: Int {
        return (self.isNegative ? -1 : 1)
    }
    
    public var isNegative: Bool = false
    
    public var intValue: HugeIntValue {
        
        let lastDigit = self.lastDigit()
        let signedValue = lastDigit.value * self.negativeScalar
        let stringValue = lastDigit.stringForPosition()
        return (signedValue, stringValue)
    }
    
    public var doubleValue: HugeDoubleValue {
        
        let mainDigit = self.lastDigit()
        let subDigitValue = self.digits[mainDigit.position - 1]?.value ?? 0
        let doubleValue = Double(mainDigit.value) + (Double(subDigitValue) / 1000.0)
        let stringValue = mainDigit.stringForPosition()
        let signedValue = doubleValue * Double(self.negativeScalar)
        
        return (signedValue, stringValue)
    }
    
    public var isZero: Bool {
        return ((self.intValue.0 == 0) && (self.intValue.1 == ""))
    }
    
    public init(withDigits digits:[Int:HugeDigit], isNegative:Bool)
    {
        self.digits = digits
        self.isNegative = isNegative
    }
    
    fileprivate init(withHugeInt hugeInt:HugeInt) {
        self.digits = hugeInt.digits
        self.isNegative = hugeInt.isNegative
    }
    
    public convenience init(withIntValue value:HugeIntValue)
    {
        let isNegative = (value.0 < 0)
        let unsignedValue = abs(value.0)
        
        let digit = HugeDigit(withPositionString: value.1, value: unsignedValue)
            
        self.init(withDigits: [digit.position:digit], isNegative:isNegative)
    }
    
    public convenience init(withInt intValue:Int) {
        
        let isNegative = (intValue < 0)
        let unsignedValue = abs(intValue)
        
        var tempValue = unsignedValue
        var digitPosition = 0
        var resultDigits = [Int:HugeDigit]()
        
        repeat {
            
            let currentValue = tempValue % 1000
            
            let digit = HugeDigit(position: digitPosition, value: currentValue)
            resultDigits[digitPosition] = digit
            
            tempValue /= 1000
            digitPosition += 1
        } while (tempValue > 0)
        
        self.init(withDigits: resultDigits, isNegative: isNegative)
        
        self.cleanUp()
    }
    
    public convenience init(withDoubleValue value:HugeDoubleValue)
    {
        let isNegative = (value.0 < 0)
        let unsignedValue = abs(value.0)
        
        let mainValue = Int(unsignedValue)
        let subValue = Int(unsignedValue * 1000) % 1000
        
        let mainDigit = HugeDigit(withPositionString: value.1, value: mainValue)
        let subDigit = HugeDigit(position: mainDigit.position - 1, value: subValue)
        
        self.init(withDigits: [mainDigit.position:mainDigit, subDigit.position:subDigit], isNegative: isNegative)
    }
    
    public static func zero() -> HugeInt {
        return HugeInt(withInt: 0)
    }
    
    fileprivate func relevantDigits(_ numberOfDigits:Int) -> [HugeDigit] {
        
        guard let maxPosition = self.digits.keys.max() else { return [HugeDigit.zero()] }
        
        let lowPosition = max(0, maxPosition - numberOfDigits)
        
        let result = self.digits(from: lowPosition, to: maxPosition)
        
        return result
    }
    
    fileprivate func digits(from startPosition:Int, to endPosition:Int) -> [HugeDigit] {
        
        var result = [HugeDigit]()
        
        for i in (startPosition ... endPosition).reversed() {
            
            if let digit = self.digits[i] {
                result.append(digit)
            } else {
                result.append(HugeDigit.zero())
            }
        }
        
        return result
    }
}

//MARK: - Equatable
extension HugeInt: Equatable {
    
    public static func ==(lhs: HugeInt, rhs: HugeInt) -> Bool {
        return (lhs.compare(rhs) == .orderedSame)
    }
}

//MARK: - Comparable
extension HugeInt: Comparable {
    
    public static func <(lhs: HugeInt, rhs: HugeInt) -> Bool {
        return (lhs.compare(rhs) == .orderedAscending)
    }

    public static func <=(lhs: HugeInt, rhs: HugeInt) -> Bool {
        return (lhs.compare(rhs) != .orderedDescending)
    }

    public static func >=(lhs: HugeInt, rhs: HugeInt) -> Bool {
        return (lhs.compare(rhs) != .orderedAscending)
    }

    public static func >(lhs: HugeInt, rhs: HugeInt) -> Bool {
        return (lhs.compare(rhs) == .orderedDescending)
    }
    
    public func compare(_ hugeInt:HugeInt) -> ComparisonResult {
        
        guard (self.isNegative == hugeInt.isNegative) else {
            return self.isNegative ? .orderedAscending : .orderedDescending
        }
        
        var result: ComparisonResult = .orderedSame
        
        let orderedKeysA = self.digits.keys.sorted()
        let orderedKeysB = hugeInt.digits.keys.sorted()
        
        for i in 0 ..< max(orderedKeysA.count, orderedKeysB.count) {
            
            var currentA: HugeDigit = HugeDigit(position: 0, value: 0)
            var currentB: HugeDigit = HugeDigit(position: 0, value: 0)
            
            if (orderedKeysA.count > i) {
                currentA = self.digits[orderedKeysA[i]] ?? HugeDigit(position: 0, value: 0)
            }
            
            if (orderedKeysB.count > i) {
                currentB = hugeInt.digits[orderedKeysB[i]] ?? HugeDigit(position: 0, value: 0)
            }
            
            let comparationResult = currentA.compare(currentB)
            
            if (comparationResult != .orderedSame) {
                result = comparationResult
                break
            }
        }
        
        //more negative is the smaller, invert the result
        if (result != .orderedSame) && self.isNegative && hugeInt.isNegative {
            result = ((result == .orderedAscending) ? .orderedDescending : .orderedAscending)
        }
        
        return result
    }
}

//MARK: - Convinenient methods
extension HugeInt {
    
    fileprivate func lastDigit() -> HugeDigit {
        
        var lastDigit: HugeDigit = HugeDigit(position: 0, value: 0)

        //remove zero elements
        self.cleanUp()

        if let maxKey = self.digits.keys.max() {
            lastDigit = self.digits[maxKey] ?? HugeDigit(position: 0, value: 0)
        }

        return lastDigit
    }
    
    fileprivate func cleanUp() {
    
        for digit in self.digits {
            if digit.value.value == 0 {
                self.digits.removeValue(forKey: digit.key)
            }
        }
    }
}

//MARK: - Operators
extension HugeInt {
    
    public static func +(left:HugeInt, right:HugeInt) -> HugeInt {
        
        let result:HugeInt
        
        //same sign
        if left.isNegative == right.isNegative {
            result = HugeInt(withHugeInt: left)
            result.unsignedAdd(hugeInt: right)
        } else {
            
            let positiveInt = left.isNegative ? right : left
            let negativeInt = left.isNegative ? left : right
            
            //invert the sign, and subtract them
            negativeInt.isNegative = false
            
            result = positiveInt - negativeInt
        }
        
        result.cleanUp()
        
        return result
    }
    
    public static func -(left:HugeInt, right:HugeInt) -> HugeInt {
        
        let result:HugeInt
        
        if !right.isNegative {
            
            if !left.isNegative {
                
                if left >= right {
                    result = HugeInt(withHugeInt: left)
                    result.unsignedSubtract(hugeInt: right)
                } else {
                    result = HugeInt(withHugeInt: right)
                    result.unsignedSubtract(hugeInt: left)
                    result.isNegative = true
                }
            } else {
                result = HugeInt(withHugeInt: left)
                result.isNegative = false
                result.unsignedAdd(hugeInt: right)
                result.isNegative = true
            }
        } else {
            
            if !left.isNegative {
                let unsignedRight = right
                unsignedRight.isNegative = false
                result = left + unsignedRight
            } else {
                let unsignedRight = right
                unsignedRight.isNegative = false
                
                let unsignedLeft = left
                unsignedLeft.isNegative = false
                
                result = unsignedRight - unsignedLeft
            }
        }
        
        result.cleanUp()
        
        return result
    }
    
    public static func *(left:HugeInt, right:HugeInt) -> HugeInt {
        
        let result:HugeInt = left.unsignedMultiply(hugeInt: right)
        result.isNegative = (left.isNegative != right.isNegative)
        
        result.cleanUp()
        
        return result
    }
    
    public static func /(left:HugeInt, right:HugeInt) -> HugeInt {
        
        let result = left.unsignedDivide(hugeInt: right).0
        result.isNegative = (left.isNegative != right.isNegative)
        
        result.cleanUp()
        
        return result
    }
    
    public static func %(left:HugeInt, right:HugeInt) -> HugeInt {
        
        let result = left.unsignedDivide(hugeInt: right).1
        result.isNegative = (left.isNegative != right.isNegative)
        
        result.cleanUp()
        
        return result
    }
    
    // multiplication
    public static func <<(left:HugeInt, right:Int) -> HugeInt {
        let result = left.shift(by: right)
        return result
    }
    
    // division
    public static func >>(left:HugeInt, right:Int) -> HugeInt {
        let result = left.shift(by: -right)
        return result
    }
}

//MARK: - Adding Methods
extension HugeInt {
    
    fileprivate func unsignedAdd(hugeInt:HugeInt) {
        
        let orderedKeys = hugeInt.digits.keys.sorted()
        
        for key in orderedKeys {
            
            var currentDigitToAdd: HugeDigit? = hugeInt.digits[key]
            
            while currentDigitToAdd != nil {
                currentDigitToAdd = self.add(digit: currentDigitToAdd!)
            }
        }
    }
    
    fileprivate func add(digit:HugeDigit) -> HugeDigit? {
        
        var transmission: HugeDigit?
        
        if let digitOnSamePosition = self.digits[digit.position] {
            
            var newValue = digitOnSamePosition.value + digit.value
            
            if (newValue >= 1000) {
                transmission = HugeDigit(position: digit.position + 1, value: 1)
                newValue -= 1000
            }
            
            self.digits[digit.position] = HugeDigit(position: digit.position, value: newValue)
        } else {
            self.digits[digit.position] = digit
        }
        
        return transmission
    }
}

//MARK: - Subtraction Methods
extension HugeInt {
    
    // self has to be bigger than the hugeInt param, since it's not handling signs
    fileprivate func unsignedSubtract(hugeInt:HugeInt) {
        
        guard self > hugeInt else {
            self.digits.removeAll()
            self.digits[0] = HugeDigit(position: 0, value: 0)
            return
        }
        
        let orderedKeys = hugeInt.digits.keys.sorted()
        
        for key in orderedKeys {
            
            var currentDigitToSubtract: HugeDigit? = hugeInt.digits[key]
            
            while currentDigitToSubtract != nil {
                currentDigitToSubtract = self.subtract(digit: currentDigitToSubtract!)
                
                if let transmission = currentDigitToSubtract {
                    if transmission.position > self.lastDigit().position {
                        break
                    }
                }
            }
        }
    }
    
    fileprivate func subtract(digit:HugeDigit) -> HugeDigit? {
        
        var transmission: HugeDigit?
        
        if let digitOnSamePosition = self.digits[digit.position] {
            
            var newValue = digitOnSamePosition.value - digit.value
            
            if (newValue < 0) {
                transmission = HugeDigit(position: digit.position + 1, value: 1)
                newValue += 1000
            }
            
            self.digits[digit.position] = HugeDigit(position: digit.position, value: newValue)
        } else {
            self.digits[digit.position] = digit
        }
        
        return transmission
    }
}

//MARK: - Multiplication Methods
extension HugeInt {

    fileprivate func unsignedMultiply(hugeInt:HugeInt) -> HugeInt {
        
        let result = HugeInt(withIntValue: (0, ""))
        
        hugeInt.digits.forEach{ currentDigit in
            
            let currentResult = self.unsignedMultiply(digit: currentDigit.value)
            result.unsignedAdd(hugeInt: currentResult)
        }
        
        return result
    }
    
    fileprivate func unsignedMultiply(digit:HugeDigit) -> HugeInt {
        
        let result = HugeInt(withIntValue: (0, ""))
        
        self.digits.forEach { currentDigit in
            
            var newValue = currentDigit.value.value * digit.value
            let newPosition = currentDigit.value.position + digit.position
            
            //Handle Transmission
            if (newValue >= 1000) {
                let upperPositionValue = Int(Double(newValue) / 1000.0)
                let transmission = HugeDigit(position: newPosition + 1, value:upperPositionValue)
                let transmissionHugeInt = HugeInt(withDigits: [newPosition + 1:transmission], isNegative: false)
                result.unsignedAdd(hugeInt: transmissionHugeInt)
                newValue -= (upperPositionValue * 1000)
            }
            
            let resultHugeDigit = HugeDigit(position: newPosition, value: newValue)
            let resultHugeInt = HugeInt(withDigits: [newPosition:resultHugeDigit], isNegative: false)
            result.unsignedAdd(hugeInt: resultHugeInt)
        }
        
        return result
    }
}

//MARK: - Division Methods
extension HugeInt {
    
    fileprivate func unsignedDivide(hugeInt:HugeInt) -> (HugeInt, HugeInt) {
        
        //we are dividing by the 4 most relevant digits
        let divisionPrecision = 4
        
        let divisorMaxPosition = hugeInt.digits.keys.max() ?? 0
        let dividentMaxPosition = self.digits.keys.max() ?? 0
        
        guard dividentMaxPosition >= divisorMaxPosition else {
            return (HugeInt.zero(), hugeInt)
        }
        
        let resultOffset = max(0, divisorMaxPosition - divisionPrecision)
        
        let divisorDigits = hugeInt.relevantDigits(divisionPrecision)
        var divisorIntValue = 0
        
        for (i, digit) in divisorDigits.reversed().enumerated() {
            divisorIntValue += digit.value * Int(pow(1000, Double(i)))
        }
        
        var leftOver = 0
        var resultDigits = [Int:HugeDigit]()
        
        for dividentPosition in (0...dividentMaxPosition).reversed() {
            
            let currentDigit: HugeDigit
            
            if let digit = self.digits[dividentPosition] {
                currentDigit = digit
            } else {
                currentDigit = HugeDigit.zero()
            }
            
            let currentIntResult = (leftOver * 1000) + currentDigit.value
            
            leftOver = currentIntResult % divisorIntValue
            
            let intResult = currentIntResult / divisorIntValue
            let finalPosition = dividentPosition - resultOffset
            
            let result = HugeDigit(position: finalPosition, value: intResult)
            
            resultDigits[finalPosition] = result
        }
        
        let resultHugeInt = HugeInt(withDigits: resultDigits, isNegative: false)
        var resultQuotient = HugeInt(withInt: leftOver)
        
        resultQuotient = resultQuotient << resultOffset
        
        return (resultHugeInt, resultQuotient)
    }
}

//MARK: - Shifting
extension HugeInt {
    
    fileprivate func shift(by position:Int) -> HugeInt {
        
        var resultDigits = [Int:HugeDigit]()
        
        for digit in self.digits {
            
            let newPosition = digit.key + position
            
            if (newPosition >= 0) {
                let newDigit = HugeDigit(position: newPosition, value: digit.value.value)
                resultDigits[newPosition] = newDigit
            }
        }
        
        let result = HugeInt(withDigits: resultDigits, isNegative: self.isNegative)
        
        return result
    }
}
