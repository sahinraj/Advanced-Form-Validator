//
//  AdvancedFormView'.swift
//  Advanced-Form-Validator
//
//  Created by sahin raj on 12/6/24.
//
import SwiftUI

struct AdvancedFormView: View {
    @StateObject private var emailValidator = Validator(rules: [ValidationRules.required, ValidationRules.email])
    @StateObject private var passwordValidator = Validator(rules: [ValidationRules.required, ValidationRules.passwordLength])
    @StateObject private var nameValidator = Validator(rules: [ValidationRules.required, ValidationRules.name])
    @StateObject private var phoneValidator = Validator(rules: [ValidationRules.required, ValidationRules.phoneNumber])
    @StateObject private var zipCodeValidator = Validator(rules: [ValidationRules.required, ValidationRules.zipCode])
    
    private var formValidator: AdvancedFormValidator {
        AdvancedFormValidator(validators: [
            emailValidator,
            passwordValidator,
            nameValidator,
            phoneValidator,
            zipCodeValidator
        ])
    }
    
    var body: some View {
        let formValidator = self.formValidator // Local reference to avoid recomputation
        
        Form {
            Section(header: Text("Personal Information")) {
                VStack(alignment: .leading) {
                    TextField("Name", text: $nameValidator.value)
                        .autocapitalization(.words)
                        .onChange(of: nameValidator.value) { _ in
                            nameValidator.validate()
                        }
                    
                    if let error = nameValidator.error {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                
                VStack(alignment: .leading) {
                    TextField("Phone Number", text: $phoneValidator.value)
                        .keyboardType(.numberPad)
                        .onChange(of: phoneValidator.value) { _ in
                            phoneValidator.validate()
                        }
                    
                    if let error = phoneValidator.error {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                
                VStack(alignment: .leading) {
                    TextField("Zip Code", text: $zipCodeValidator.value)
                        .keyboardType(.numberPad)
                        .onChange(of: zipCodeValidator.value) { _ in
                            zipCodeValidator.validate()
                        }
                    
                    if let error = zipCodeValidator.error {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
            
            Section(header: Text("Login Details")) {
                VStack(alignment: .leading) {
                    TextField("Email", text: $emailValidator.value)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .onChange(of: emailValidator.value) { _ in
                            emailValidator.validate()
                        }
                    
                    if let error = emailValidator.error {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                
                VStack(alignment: .leading) {
                    SecureField("Password", text: $passwordValidator.value)
                        .onChange(of: passwordValidator.value) { _ in
                            passwordValidator.validate()
                        }
                    
                    if let error = passwordValidator.error {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
            
            Section {
                Button(action: {
                    handleFormSubmission(formValidator: formValidator)
                }) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(formValidator.isValid ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(!formValidator.isValid)
            }
        }
        .padding()
    }
    
    private func handleFormSubmission(formValidator: AdvancedFormValidator) {
        if formValidator.validateAll() {
            print("Form submitted successfully!")
        } else {
            print("Form validation failed.")
        }
    }
}
