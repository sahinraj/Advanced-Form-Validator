# Advanced Form Validation Framework in SwiftUI

This SwiftUI project demonstrates an **Advanced Form Validation Framework** capable of handling multiple form fields with real-time error feedback, modular validation rules, and dynamic button states. This is perfect for iOS developers looking to showcase or learn advanced form handling in SwiftUI.

---

## Features

- 🔍 **Dynamic Field Validation**:
  - Live validation as the user types.
  - Inline error messages for invalid fields.
  
- 🎨 **Reusable Validation Framework**:
  - Easily add custom validation rules for any field.
  - Predefined rules for common use cases (e.g., email, phone number, zip code).

- ⚙️ **Modular Design**:
  - Manage individual field validators and form-wide validation logic with ease.

- 💡 **Combine Integration**:
  - Reactive updates for button states based on form validity.

---

## Fields and Validations

The form includes the following fields with associated validations:

1. **Name**:
   - Must be at least 3 characters long.
   - Required.

2. **Phone Number**:
   - Must be exactly 10 digits.
   - Required.

3. **Zip Code**:
   - Supports standard 5-digit or ZIP+4 formats (e.g., `12345` or `12345-6789`).
   - Required.

4. **Email**:
   - Must be a valid email address (e.g., `example@domain.com`).
   - Required.

5. **Password**:
   - Must be at least 8 characters long.
   - Required.

---

## Screenshot
![Simulator Screenshot - iPhone 16 Pro - 2024-12-06 at 23 44 32](https://github.com/user-attachments/assets/5539afb3-52c6-4e31-b4d8-5d7eddd09f51)

## Video
https://github.com/user-attachments/assets/3f308ce9-b0a3-4b65-9114-3edba5400b4b



---

## How It Works

### Validation Framework

The project is built around a reusable validation framework:

1. **`ValidationRule`**:
   - Defines a single validation rule (e.g., "Must be at least 8 characters long").
   
   ```swift
   struct ValidationRule {
       let errorMessage: String
       let validate: (String) -> Bool
   }
   ```

2. **`Validator`**:
   - Manages multiple validation rules for a single field.
   - Tracks the field's current value and error state.
   
   ```swift
   class Validator: ObservableObject {
       @Published var value: String = ""
       @Published var error: String? = nil
       
       private var rules: [ValidationRule]
       
       func validate() -> Bool {
           // Validation logic
       }
   }
   ```

3. **`AdvancedFormValidator`**:
   - Combines individual field validators to manage form-wide validation state.
   - Ensures the "Submit" button is enabled only when all fields are valid.

---

### Form Example

The `AdvancedFormView` demonstrates how to use the framework:

```swift
struct AdvancedFormView: View {
    @StateObject private var emailValidator = Validator(rules: [ValidationRules.required, ValidationRules.email])
    @StateObject private var passwordValidator = Validator(rules: [ValidationRules.required, ValidationRules.passwordLength])
    
    private var formValidator: AdvancedFormValidator {
        AdvancedFormValidator(validators: [emailValidator, passwordValidator])
    }
    
    var body: some View {
        Form {
            Section(header: Text("Login Details")) {
                TextField("Email", text: $emailValidator.value)
                    .onChange(of: emailValidator.value) { _ in emailValidator.validate() }
                
                if let error = emailValidator.error {
                    Text(error).foregroundColor(.red)
                }
                
                SecureField("Password", text: $passwordValidator.value)
                    .onChange(of: passwordValidator.value) { _ in passwordValidator.validate() }
                
                if let error = passwordValidator.error {
                    Text(error).foregroundColor(.red)
                }
            }
            
            Section {
                Button("Submit", action: submitForm)
                    .disabled(!formValidator.isValid)
            }
        }
    }
}
```

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/sahinraj/Advanced-Form-Validator.git
   cd advanced-form-validator
   ```

2. Open the project in Xcode:
   ```bash
   open AdvancedFormValidator.xcodeproj
   ```

3. Build and run the app in the simulator or on a device.

---

## Usage

### Adding a New Field

1. Create a new `Validator` with the required rules:
   ```swift
   @StateObject private var nameValidator = Validator(rules: [ValidationRules.required, ValidationRules.name])
   ```

2. Add the field to the `AdvancedFormValidator`:
   ```swift
   private var formValidator: AdvancedFormValidator {
       AdvancedFormValidator(validators: [emailValidator, passwordValidator, nameValidator])
   }
   ```

3. Add the field to the `Form` in `AdvancedFormView`:
   ```swift
   TextField("Name", text: $nameValidator.value)
       .onChange(of: nameValidator.value) { _ in nameValidator.validate() }
   ```

---

## Requirements

- iOS 16.0+
- Swift 5.7+
- Xcode 14.0+

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Author

**Sahin Raj**  
- [GitHub](https://github.com/sahinraj)  
- [LinkedIn](https://www.linkedin.com/in/sahinraj/)  

---
