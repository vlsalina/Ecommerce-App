//
//  SignupAction.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/15/22.
//

import SwiftUI

struct SignupAction: View {
    
    @Binding var firstname: String
    @Binding var lastname: String
    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String
    @Binding var mobileNumber: String
    
    @State var message = ""
    @State var showNotification = false
    @State var showAlert = false
    @State var showSuccess = false
    
    var body: some View {
        VStack {
            HStack {
                Text("By selecting Agree and continue below, I agree to Terms of Service and Privacy Policy")
                    .foregroundColor(Color.white)
                Spacer()
            }
            VStack(spacing: 10) {
                Button (action: {
                    let result = SignupPage2ViewModel.validateCredentials(credentials: SignupCredentials(firstname: firstname, lastname: lastname, email: email, password: password, confirmPassword: confirmPassword, mobileNumber: mobileNumber))
                    
                    if (result.0) {
                        CDUsersHelper.cdUsersHelper.addNewUser(userObj: UserModel(userId: UUID().uuidString, firstname: firstname, lastname: lastname, email: email, password: password, mobileNumber: mobileNumber))
                        
                        firstname = ""
                        lastname = ""
                        email = ""
                        password = ""
                        confirmPassword = ""
                        mobileNumber = ""
                        
                        showSuccess = true
                        showAlert = false
                        showNotification = true
                    } else {
                        message = result.1
                        showSuccess = false
                        showAlert = true
                        showNotification = true
                    }
                }) {
                    Text("Agree and continue")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(Color.green)
                }
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(15)
                GoToLogin()
                
            }
        }
        .padding([.top], 15)
        .alert(isPresented: $showNotification) {
            if (showSuccess && !showAlert) {
                return Alert(title: Text("Congratulations!"), message: Text("You're all set! You can now login."), dismissButton: .default(Text("OK")))
            }
            
            return Alert(title: Text("Notification"), message: Text(message), dismissButton: .default(Text("OK")))
        }
        
    }
}

