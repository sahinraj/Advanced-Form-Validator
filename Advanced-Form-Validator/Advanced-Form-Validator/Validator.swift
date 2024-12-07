//
//  Validator.swift
//  Advanced-Form-Validator
//
//  Created by sahin raj on 12/6/24.
//

import Foundation

class Validator: ObservableObject {
    @Published var value: String = ""
    @Published var error: String? = nil
    private var rules: [ValidationRule] = []
    
    init(rules: [ValidationRule]) {
        self.rules = rules
    }
    
    func validate() -> Bool {
        for rule in rules {
            if !rule.validate(value) {
                error = rule.errorMessage
                return false
            }
        }
        error = nil
        return true
    }
}
