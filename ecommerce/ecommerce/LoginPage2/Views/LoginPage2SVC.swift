//
//  LoginPage2SVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/15/22.
//

import SwiftUI

struct LoginPage2SVC: View {
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBack()
            Spacer()
            ZStack {
                Logo()
                    .offset(y: -275)
                VStack {
                    HStack {
                        Text("Log in")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding(.horizontal, 15)
                    LoginPageModal()
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.black)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}
