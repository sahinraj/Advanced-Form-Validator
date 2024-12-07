//
//  ValidationRule.swift
//  Advanced-Form-Validator
//
//  Created by sahin raj on 12/6/24.
//

import Foundation

struct ValidationRule {
    let errorMessage: String
    let validate: (String) -> Bool
    
    init(errorMessage: String, validate: @escaping (String) -> Bool) {
        self.errorMessage = errorMessage
        self.validate = validate
    }
}
