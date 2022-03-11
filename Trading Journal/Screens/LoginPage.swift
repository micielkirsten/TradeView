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
                    Text(loginData.registeredUser ? "Register" : "Login")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    
                    //Text field
                    CustomTextField(icon: "envelope", title: "Email", hint: "carl@email.com", value: $loginData.email, showPassword: $loginData.showPassword)
                        .padding(.top, 10)
                    CustomTextField(icon: "lock", title: "Password", hint: "Carl1sTh3BestCat", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top, 10)
                    
                    //check if user is registered
                    if loginData.registeredUser{
                        CustomTextField(icon: "envelope", title: "Re-Enter Password", hint: "I Love You, Riley", value: $loginData.enterPassword, showPassword: $loginData.showEnterPassword)
                            .padding(.top, 10)

                    }
                    
                    // forgot password button
                    Button {
                        loginData.ForgotPassword()
                    } label: {
                        Text("Forgot Password")
                            .foregroundColor(Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00)))
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    // Login button
                    Button {
                        if loginData.registeredUser{
                            loginData.Register()
                        } else{
                            loginData.Login()
                        }
                    } label: {
                        Text("Login")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background((Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00))))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)

                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    //sign up button
                    Button {
                        withAnimation{
                            loginData.registeredUser.toggle()
                        }
                    } label: {
                        Text(loginData.registeredUser ?  "Back to Login" : "Sign Up")
                            .foregroundColor(Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00)))
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                    }

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
        
        
        // clear data
        .onChange(of: loginData.registeredUser){
            newValue in
            
            loginData.email = ""
            loginData.password = ""
            loginData.enterPassword = ""
            loginData.showPassword = false
            loginData.showEnterPassword = false
        }
    }
    
    @ViewBuilder
    //text feild for login info
    func CustomTextField (icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>)-> some View{
        VStack(alignment: .leading, spacing: 12){
            
            Label {
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                
            } icon: {
                Image(systemName: icon)
                
            }
            .foregroundColor(Color.black.opacity(0.7))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                //hides the password input
                SecureField(hint, text: value)
                    .padding(.top, 2)
            }
            else{
                TextField(hint, text: value)
                    . padding(.top,2)
            }

            Divider()
                .background(Color.black.opacity(0.8))
        }
        //Button to show password
        .overlay(
        Group{
            if title.contains("Password"){
                Button (action: {
                    showPassword.wrappedValue.toggle()
                }, label: {
                    Text(showPassword.wrappedValue ? "Hide" : "Show")
                        .foregroundColor(Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00)))
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                })
                    .offset(y: 10)
            }

        }
        // moves the show from the middle to side
        ,alignment: .trailing
        )
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
