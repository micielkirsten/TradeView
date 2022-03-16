//
//  GetStarted.swift
//  Trading Journal
//
//  Created by Miciel Kirsten on 3/7/22.
//

import SwiftUI


struct GetStarted: View {
    @State var showLoginPage: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center){
            Text("TradeView")
                .font(.system(size: 70))
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            
            Button {
                withAnimation{
                    showLoginPage = true
                }
            } label: {
                Text("Get Started")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00)))
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(20)
                    
            }
            .padding(.horizontal,33)
            .offset(y: getRect().height < 750 ? 20 : 40)
        }
        .padding()
        .padding(.top, getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: . infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00)))
        
        
        //call new page with transition
        .overlay(
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GetStarted()
        }
    }
}

// for the display to adjust
extension View{
    func getRec ()-> CGRect{
        return UIScreen.main.bounds
    }
}
