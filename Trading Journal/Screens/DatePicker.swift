//
//  DatePicker.swift
//  Trading Journal
//
//  Created by Miciel Kirsten on 3/7/22.
//

import SwiftUI

struct DatePicker: View {
    @Binding var currentDate: Date
    var body: some View {
        VStack{
            
            HStack{
                
                VStack(alignment: .leading, spacing: 20){
                    
                    Text("2022")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("March")
                        .font(.title.bold())
                }
                Spacer(minLength: 0)
                
                Button{
                    
                } label: {
                    Image(systemName: "left arrow")
                }
            }
        }
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
