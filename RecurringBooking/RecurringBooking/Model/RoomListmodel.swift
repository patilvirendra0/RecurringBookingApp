//
//  roomListmodel.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation

// MARK: - Welcome
struct RoomlistModel: Codable {
    
    let data : Data
    let id, displayName: String
    let version: Int
}

// MARK: - DataClass
struct Data: Codable {
    let bookingRooms: [BookingRoom]
}

// MARK: - BookingRoom
struct BookingRoom: Codable {
    let fee, endTime, feeFkey, roomFkey: String
    let roomName, startTime: String
}


//// MARK: - Welcome
//struct RoomlistModel: Codable {
//    
//    let bookingRooms: [BookingRoom]
//}
//
//// MARK: - BookingRoom
//struct BookingRoom: Codable {
//    let fee, endTime, feeFkey, roomFkey: String
//    let roomName, startTime: String
//}
