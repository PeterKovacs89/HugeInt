//
//  StringExtension.swift
//  HugeInt
//
//  Created by PeterKovacs on 2018. 02. 05..
//  Copyright © 2018. KP. All rights reserved.
//

import Foundation

extension String {
    var asciiArray: [Int] {
        return self.unicodeScalars.filter{$0.isASCII}.map{Int($0.value)}
    }
}
