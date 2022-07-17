//
//  LoginAction.swift
//  ecommerce
//
//  Created by liban 

import SwiftUI

struct LoginAction: View {
    
    @Binding var email: String
    @Binding var password: String
    @State var showNextView = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            NavigationLink(destination: MainTabControllerSVC().navigationTitle("").navigationBarHidden(true), isActive: $showNextView) {
                EmptyView()
            }
            VStack(spacing: 10) {
                Button (action: {
                    showNextView = validate()
                }) {
                    Text("Continue")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(Color.green)
                }
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(15)
                GoToSignup()
            }
        }
        .padding([.top], 15)
    }
    
    func validate() -> Bool {
        var result = false
        
        if checkInput(text: email) && checkInput(text: password){
            
            //check if user is registered
            if !CDUsersHelper.cdUsersHelper.isUserRegistered(email: email){
                print("please sign up first")
            }else{
                //check if password is correct
                let correctpassword = CDUsersHelper.cdUsersHelper.getOne(email: email).password
                let uzer = CDUsersHelper.cdUsersHelper.getOne(email: email)
                if password == correctpassword{
                    print("you entered the correct password")
                    result = true
                    LoginPageViewModel.setUserDefaults(user: uzer)
                } else{
                    print(" please try entering the correct password")
                }
            }
        }
        else{
            print("please input username and password")
        }
        
        return result
    }
    
    func checkInput(text: String) -> Bool{
        var isValid = false
        if !text.isEmpty && text != "" && text != nil{
            isValid = true
        }
        return isValid
    }
    
}

