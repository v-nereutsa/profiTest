//
//  StringProtocolExtension.swift
//  profiTest
//
//  Created by Владимир Нереуца on 23.10.2021.
//

import Foundation

extension StringProtocol {    
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
