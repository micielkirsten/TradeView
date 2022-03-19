//
//  TradeLog.swift
//  Trading Journal
//
//  Created by Miciel Kirsten on 3/18/22.
//

import SwiftUI

//Where to input trading logs

//array of trades
struct Trade: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

//Total trades meta view
struct TradeMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Trade]
    var taskDate: Date
}

//sample date for test
func getSampleDate(offset: Int) -> Date{
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

//sample tasks
var trades: [TradeMetaData] = [
    
    TradeMetaData(task: [
        
        Trade(title: "SPY 440C 3/18"),
        Trade(title: "SPY 435P 3/18")
    ], taskDate: getSampleDate(offset: 1)),
    TradeMetaData(task: [
        Trade(title: "SPY 440C 3/18"),
        Trade(title: "SPY 435P 3/18")
    ], taskDate: getSampleDate(offset: -3))
]
