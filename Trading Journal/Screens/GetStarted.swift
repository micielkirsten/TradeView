//
//  GetStarted.swift
//  Trading Journal
//
//  Created by Miciel Kirsten on 3/7/22.
//

import SwiftUI

struct GetStarted: View {
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("TradeView")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .position(x: 215, y: 300)
                
                Spacer()
                
                VStack{
                    Button {
                        CalendarView()
                    } label: {
                            Text("Get Started")
                            .fontWeight(.semibold)
                            .frame(width: 200, height: 50 ,alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(20)
                        }
                    Spacer()
                }
            }
        }
    }
}

struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
