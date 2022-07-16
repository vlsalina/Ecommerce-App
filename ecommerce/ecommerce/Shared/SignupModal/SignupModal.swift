//
//  SignupModal.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/6/22.
//

import SwiftUI

struct SignupModal: View {
    var body: some View {
        VStack(alignment: .leading) {
            if (!userDefaults.bool(forKey: "isLoggedIn")) {
                Group {
                    Text("Sign in for the best experience")
                        .font(.title2)
                        .fontWeight(.light)
                    NavigationLink(destination: LoginPage2SVC()) {
                        Text("Sign in securely")
                            .fontWeight(.light)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .border(Color.orange)
                    }
                    .foregroundColor(Color.black)
                    .background(Color.orange)
                }
            } else {
                Group {
                    HStack {
                        Text("Welcome back!")
                            .font(.title3)
                            .foregroundColor(Color.accentColor)
                    }
                }
            }
        }
        .padding()
    }
}
