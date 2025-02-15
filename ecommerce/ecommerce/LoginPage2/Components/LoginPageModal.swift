//
//  LoginPageModal.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/15/22.
//

import SwiftUI

struct LoginPageModal: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Welcome back!")
                .foregroundColor(Color.white)
                .fontWeight(.light)
            HStack {
                Spacer()
            }
            SignupField(placeholder: "Email", value: $email )
            LoginPassword(placeholderdos: "Password", valuedos: $password)
            //SignupField(placeholder: "Password", value: $password)
            LoginAction(email: $email, password: $password)
        }
        .padding()
        .background(Color.gray.opacity(0.25))
        .cornerRadius(15)
    }
}

