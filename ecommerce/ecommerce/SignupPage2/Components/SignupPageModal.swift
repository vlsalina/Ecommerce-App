//
//  SignupPageModal.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/15/22.
//

import SwiftUI

struct SignupPageModal: View {
    
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var mobileNumber = ""
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Create an account to enjoy all the features!")
                .foregroundColor(Color.white)
                .fontWeight(.light)
            HStack {
                Spacer()
            }
            SignupField(placeholder: "First Name", value: $firstname )
            SignupField(placeholder: "Last Name", value: $lastname )
            SignupField(placeholder: "Email", value: $email)
            SignupPassword(placeholder: "Password", value: $password)
            SignupPassword(placeholder: "Confirm Password", value: $confirmPassword)
            SignupField(placeholder: "Mobile Number", value: $mobileNumber)
            SignupAction(firstname: $firstname, lastname: $lastname, email: $email, password: $password, confirmPassword: $confirmPassword, mobileNumber: $mobileNumber)
        }
        .padding()
        .background(Color.gray.opacity(0.25))
        .cornerRadius(15)
    }
}
