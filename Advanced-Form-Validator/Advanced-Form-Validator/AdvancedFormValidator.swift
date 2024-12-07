//
//  AdvancedFormValidator.swift
//  Advanced-Form-Validator
//
//  Created by sahin raj on 12/6/24.
//

import Foundation
import Combine

class AdvancedFormValidator: ObservableObject {
    @Published var isValid: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    private var validators: [Validator]
    
    init(validators: [Validator]) {
        self.validators = validators
        
        // Automatically update form validity based on individual fields
        Publishers.combineLatestMany(validators.map { $0.$error })
            .map { $0.allSatisfy { $0 == nil } }
            .assign(to: &$isValid)
    }
    
    func validateAll() -> Bool {
        return validators.allSatisfy { $0.validate() }
    }
}

extension Publishers {
    /// Combine an array of publishers into a single publisher that emits an array of their latest values.
    static func combineLatestMany<P: Publisher>(_ publishers: [P]) -> AnyPublisher<[P.Output], P.Failure> {
        guard !publishers.isEmpty else {
            // If there are no publishers, return an empty array
            return Just([]).setFailureType(to: P.Failure.self).eraseToAnyPublisher()
        }
        
        return publishers
            .dropFirst()
            .reduce(
                publishers[0].map { [$0] }.eraseToAnyPublisher()
            ) { combined, next in
                combined.combineLatest(next) { $0 + [$1] }.eraseToAnyPublisher()
            }
    }
}
