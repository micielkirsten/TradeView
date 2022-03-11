//
//  LoginPage.swift
//  Trading Journal
//
//  Created by Miciel Kirsten on 3/9/22.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        VStack{

            VStack{
                
                Text("Welcome Back")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                
            }
            .frame(height: getRect().height / 3.5)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15){
                    Text("Login")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    
                    //Text field
                    CustomTextField(icon: "envelope", title: "Email", hint: "carl@email.com", value: $loginData.email, showPassword: $loginData.showPassword)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "Carl1sTh3BestCat", value: $loginData.email, showPassword: $loginData.showPassword)
                    
                }
                .padding(45)
            }
            //white bg layer for sing in view
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                //applying custom corner
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 35))
                    .ignoresSafeArea()
            )
        }
        //green bg layer
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00)))
    }
    
    @ViewBuilder
    //text feild for login ingo
    func CustomTextField (icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>)-> some View{
        VStack(alignment: .leading, spacing: 12){
            
            Label {
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                
            } icon: {
                Image(systemName: icon)
                
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            TextField(hint, text: value)
            Divider()
        }
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

extension View{
    func getRect()-> CGRect{
        return UIScreen.main.bounds
    }
}
