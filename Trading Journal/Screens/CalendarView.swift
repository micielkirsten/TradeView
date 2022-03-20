//
//  CalendarView.swift
//  Trading Journal
//
//  Created by Miciel Kirsten on 3/7/22.
//

import SwiftUI

struct CalendarView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
        VStack(spacing: 20){
                //custom date picker
            
            DatePicker(currentDate: $currentDate)
            }
        .padding(.vertical)
        }
        //buttons for adding trades
        .safeAreaInset(edge: .bottom){
            HStack{
                Button{
                    
                } label: {
                    Text("Graph")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color(.black), in: Capsule())
                }
                Button{
                    
                } label: {
                    Text("Add Trade")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color(.red), in: Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top,10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
