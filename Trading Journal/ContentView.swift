//
//  ContentView.swift
//  Trading Journal
//
//  Created by Miciel Kirsten on 3/5/22.
//

import SwiftUI
	
struct ContentView: View {
    var body: some View{
        ZStack{
            Color(#colorLiteral(red: 0.04, green: 0.09, blue: 0.05, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("TradeView")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
