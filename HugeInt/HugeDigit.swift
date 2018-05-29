//
//  HugeDigit.swift
//  HugeInt
//
//  Created by PeterKovacs on 2018. 02. 02..
//  Copyright © 2018. KP. All rights reserved.
//

import Foundation

struct HugeDigit {
    var position:Int = 0    //position of the digit
    var value:Int = 0       //value of this digit between 0 and 999
    
    fileprivate static let characterPositionOffset = 97
    fileprivate static let characterCount = 26
    
    init(position:Int, value:Int) {
        
        self.value = value
        self.position = position
    }
    
    init(withPositionString string:String, value:Int) {
        
        assert(value >= 0, "Digits can't store negative value. Negative numbers are represented with positive digits, and a true isNegative flag.")
        
        let position = HugeDigit.position(fromString: string)
        self.init(position: position, value: value)
    }
    
    static func zero() -> HugeDigit {
        return HugeDigit(position: 0, value: 0)
    }
}

extension HugeDigit: Equatable {
    
    static func ==(lhs: HugeDigit, rhs: HugeDigit) -> Bool {
        return ((lhs.position == rhs.position) && (lhs.value == rhs.value))
    }
}

extension HugeDigit: Comparable {
    
    static func <(lhs: HugeDigit, rhs: HugeDigit) -> Bool {
        return (lhs.compare(rhs) == .orderedAscending)
    }
    
    static func <=(lhs: HugeDigit, rhs: HugeDigit) -> Bool {
        return (lhs.compare(rhs) != .orderedDescending)
    }
    
    static func >=(lhs: HugeDigit, rhs: HugeDigit) -> Bool {
        return (lhs.compare(rhs) != .orderedAscending)
    }
    
    static func >(lhs: HugeDigit, rhs: HugeDigit) -> Bool {
        return (lhs.compare(rhs) == .orderedDescending)
    }
    
    func compare(_ hugeDigit:HugeDigit) -> ComparisonResult {
        
        var result: ComparisonResult
        
        if (self.position > hugeDigit.position) {
            result = .orderedDescending
        } else if (self.position < hugeDigit.position) {
            result = .orderedAscending
        } else {
            if (self.value > hugeDigit.value) {
                result = .orderedDescending
            } else if (self.value < hugeDigit.value) {
                result = .orderedAscending
            } else {
                result = .orderedSame
            }
        }
        
        return result
    }
}

//MARK: - Conversion
extension HugeDigit {
    
    fileprivate static func position(fromString string:String) -> Int {
        
        let positionArray = string.asciiArray.map{($0 - HugeDigit.characterPositionOffset) + 1}
        
        guard positionArray.count > 0 else {
            return 0
        }
        
        var result = 0
        
        for position in positionArray {
            result = (result * HugeDigit.characterCount) + position
        }
        
        return result
    }
    
    private func character(forPosition position:Int) -> (Int, String) {
        
        guard position > 0 else {
            return (0, "")
        }
        
        var result = ""
        var normalizedPosition = (position % HugeDigit.characterCount)
        
        if (normalizedPosition == 0) {
            normalizedPosition = HugeDigit.characterCount
        }
        
        let charPosition = HugeDigit.characterPositionOffset + (normalizedPosition - 1)
        
        if let unicodeChar = UnicodeScalar(charPosition) {
            result = String(Character(unicodeChar))
        }
        
        return (normalizedPosition, result)
    }
    
    func stringForPosition() -> String {
        
        var resultString = ""
        var currentPosition = self.position
        
        while currentPosition > 0 {
            
            let currentResult = self.character(forPosition: currentPosition)
            resultString = "\(currentResult.1)\(resultString)"
            
            currentPosition -= currentResult.0
            currentPosition /= HugeDigit.characterCount
        }
        
        return resultString
    }
}
