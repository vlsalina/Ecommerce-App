//
//  CheckoutForm.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct CheckoutForm: View {
    @EnvironmentObject var cartManager: CartManager
    
    @State var name = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    @State var address = ""
    @State var zip = ""
    @State var city = ""
    @State var country = ""
    
    @State var COD = false
    @State var eMoney = false
    @State var eMoneyNum = ""
    @State var eMoneyPin = ""
    @State var creditCardNum = ""
    
    let columns: [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("CHECKOUT")
                .font(.title)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        Text("BILLING DETAILS")
                            .foregroundColor(.red)
                            .padding([.top], 15)
                            .padding([.bottom], 10)
                        CheckoutField(title: "Name", placeholder: "Enter name here", value: $name)
                        CheckoutField(title: "Email", placeholder: "Enter name email", value: $email)
                        CheckoutField(title: "Phone Number", placeholder: "+1202-555-0136", value: $phoneNumber)
                        
                    }
                    
                    Group {
                        Text("SHIPPING INFO")
                            .foregroundColor(.red)
                            .padding([.top], 30)
                            .padding([.bottom], 10)
                        CheckoutField(title: "Your Address", placeholder: "1137 Williams Avenue", value: $address)
                        CheckoutField(title: "ZIP Code", placeholder: "10001", value: $zip)
                        CheckoutField(title: "City", placeholder: "New York", value: $city)
                        CheckoutField(title: "Country", placeholder: "United States", value: $country)
                        
                    }
                    
                    Group {
                        Text("PAYMENT DETAILS")
                            .foregroundColor(.red)
                            .padding([.top], 30)
                            .padding([.bottom], 10)
                        VStack(spacing: 15) {
                            CheckoutRadioField(label: "e-Money", value: $eMoney, alt: $COD)
                            CheckoutRadioField(label: "Cash on Delivery", value: $COD, alt: $eMoney)
                        }
                        .padding([.bottom], 8)
                        CheckoutField(title: "e-Money Number", placeholder: "238521993", value: $eMoneyNum)
                        CheckoutField(title: "e-Money PIN", placeholder: "1234", value: $eMoneyPin)
                        CheckoutField(title: "Credit Card #", placeholder: "1234-5678-9012-3456", value: $creditCardNum)
                    }
                    
                    
                    CheckoutSummary(checkoutDetailsObj: CheckoutDetailsObj(name: name, email: email, phoneNumber: phoneNumber, address: address, zip: zip, city: city, country: country))
                        .padding([.top], 30)
                        .environmentObject(cartManager)
                }
                
            }
            
        }
        .padding([.leading, .trailing], 27)
        .padding([.top], 20)
    }
}

struct CheckoutForm_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutForm()
    }
}
