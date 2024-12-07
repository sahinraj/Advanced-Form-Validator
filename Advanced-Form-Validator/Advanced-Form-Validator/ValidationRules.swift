//
//  ValidationRules.swift
//  Advanced-Form-Validator
//
//  Created by sahin raj on 12/6/24.
//

import Foundation

struct ValidationRules {
    static let required = ValidationRule(errorMessage: "This field is required") {
        !$0.isEmpty
    }
    
    static let email = ValidationRule(errorMessage: "Invalid email address") {
        NSPredicate(format: "SELF MATCHES %@", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$").evaluate(with: $0)
    }
    
    static let phoneNumber = ValidationRule(errorMessage: "Invalid phone number") {
        NSPredicate(format: "SELF MATCHES %@", "^[0-9]{10}$").evaluate(with: $0)
    }
    
    static let zipCode = ValidationRule(errorMessage: "Invalid zip code") {
        NSPredicate(format: "SELF MATCHES %@", "^[0-9]{5}(-[0-9]{4})?$").evaluate(with: $0)
    }
    
    static let name = ValidationRule(errorMessage: "Name must be at least 3 characters long") {
        $0.count >= 3
    }
    
    static let passwordLength = ValidationRule(errorMessage: "Password must be at least 8 characters long") {
            $0.count >= 8
    }
}
