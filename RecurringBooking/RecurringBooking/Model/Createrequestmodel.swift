//
//  Createrequestmodel.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 12/12/23.
//

import Foundation


struct CreaterequestModel: Codable {
    
    let data : createrequestData
    let id, displayName: String
    let version: Int
}


struct createrequestData: Codable {
    let endDate, feeFkey , roomFkey: String
    let childFkey, startTime: String
    let daysAWeek: [String]
    let startDate : String
}
