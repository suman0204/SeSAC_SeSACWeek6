//
//  SignInViewModel.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/09/13.
//

import Foundation

class SignInViewModel {
    
    var email: Observable<String?> = Observable("")
    var emailValid = Observable(false)
    
    var password: Observable<String?> = Observable("")
    var passwordValid = Observable(false)

    var nickname: Observable<String?> = Observable("")
    var nicknameValid = Observable(false)

    var location: Observable<String?> = Observable("")
    var locationValid = Observable(false)

    var code: Observable<String?> = Observable("")
    var codeValid = Observable(false)
    
    var signUpValid = Observable(false)

    
    func checkEmailValidation() {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        guard let email = email.value else {
            return print("이메일 입력해주세요")
        }
        
        if emailTest.evaluate(with: email) {
            emailValid.value = true
        } else {
            emailValid.value = false
        }
    }
    
    func checkPasswordValidation() {
        guard let password = password.value else {
            return print("비밀 번호 입력해주세요")
        }
        if password.count >= 6 {
            passwordValid.value = true
        } else {
            passwordValid.value = false
        }
    }
    
    func checkSignUpValidation() {
        if emailValid.value && passwordValid.value {
            signUpValid.value = true
        } else {
            signUpValid.value = false
        }
    }
    
}
