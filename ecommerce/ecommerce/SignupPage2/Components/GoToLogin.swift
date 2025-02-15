//
//  GoToLogin.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/15/22.
//

import SwiftUI

struct GoToLogin: View {
    
    @State var showNextView = false
    
    var body: some View {
        Section {
            NavigationLink(destination: LoginPage2SVC().navigationTitle("").navigationBarHidden(true), isActive: $showNextView) {
                EmptyView()
            }
            Button (action: {
                showNextView = true
            }) {
                Text("Login")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.blue.opacity(0.5))
            }
            .foregroundColor(Color.white)
            .background(Color.blue.opacity(0.5))
            .cornerRadius(15)
        }
    }
}
