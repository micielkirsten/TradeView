//
//  DatePicker.swift
//  Trading Journal
//
//  Created by Miciel Kirsten on 3/7/22.
//

import SwiftUI

struct DatePicker: View {
    @Binding var currentDate: Date
    
    //updates current month when arrow buttons are clicked
    @State var currentMonth: Int = 0
    
    var body: some View {
        VStack (spacing: 35){
            
            //Days of the week
            
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack (spacing: 20){
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title.bold())
                }
                Spacer(minLength: 0)
                
                Button {
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                
                Button {
                    withAnimation{
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.red)
                }
            }
            .padding(.horizontal)
            
            // day view
            HStack (spacing: 0){
                ForEach(days,id: \.self){
                    
                    day in
                    
                    Text(day)
                        .font(.system(size: 20))
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                    
                }
            }
            
            //Lazy grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15){
                
                ForEach(extractDate()){
                    value in
                    //prints individual dates
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color(.red))
                                .padding(.horizontal,8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                    
                }
            }
        }
        VStack(spacing: 15){
            Text("Trade Log")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
            
            if let trade = trades.first(where: { trade in
                
                return isSameDay(date1: trade.taskDate, date2: currentDate)
                
            }){
                ForEach(trade.task){trade in
                    VStack(alignment: .leading, spacing: 10){
                        Text(trade.time
                            .addingTimeInterval(CGFloat
                                .random(in: 0...5000)), style: .time)
                        
                        Text(trade.title)
                            .font(.title2.bold())
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        
                        Color(.red)
                            .opacity(0.5)
                            .cornerRadius(10)
                    )
                }
            }
            else{
                Text("No Trades Found")
            }
        }
        .padding()
        // updates current month
        .onChange(of: currentMonth) { newValue in
            
            currentDate = getCurrentMonh()
            
        }
    }
    
    @ViewBuilder
    
    func CardView(value: DateValue) -> some View{
        VStack{
            if value.day != -1{
            
                if let trade = trades.first(where: { trade in
                    
                    return isSameDay(date1: trade.taskDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: trade.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: trade.taskDate, date2: currentDate) ? .white : Color(.red))
                        .frame(width: 8, height: 8)
                }
                else{
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical,8)
        .frame(height: 60, alignment: .top)
    }
    
    //checking dates
    func isSameDay(date1: Date, date2: Date) -> Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    //extract year and month for display
    func extraDate ()-> [String]{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonh ()-> Date{
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date())
        else{
            return Date()
        }
        return currentMonth
    }
    
    func extractDate ()-> [DateValue]{
        
        let calendar = Calendar.current
        // get current month date
        let currentMonth = getCurrentMonh()
        
        var days = currentMonth.getAllDate().compactMap {
            date -> DateValue in
            // gets the days
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        //adding offset days
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
            return days
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}


// extending dates to current month dates

extension Date{
    
    func getAllDate ()-> [Date]{
        
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        // returning all the dates
        return range.compactMap{
            
            day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
