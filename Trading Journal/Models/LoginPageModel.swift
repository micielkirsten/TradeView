//
//  LoginPageModel.swift
//  Trading Journal
//
//  Created by Miciel Kirsten on 3/9/22.
//

import SwiftUI

class LoginPageModel: ObservableObject{
    
    // Login Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    //for signing up
    @Published var enterPassword: String = ""
    @Published var showEnterPassword: Bool = false
    
    //call functions
    func Login(){
        
    }
    
    func Register(){
        
    }
    
    func ForgotPassword(){
        
    }
}
