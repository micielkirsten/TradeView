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
                
            }
            
            ScrollView(.vertical, showsIndicators: false){
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                //CustomCorners
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, minHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00))
                            .edgesIgnoringSafeArea(.all))
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
