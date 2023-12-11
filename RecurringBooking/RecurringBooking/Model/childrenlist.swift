//
//  childrenlist.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 09/12/23.
//

import Foundation

// MARK: - ChildrenList
struct ChildrenList: Codable {
    let data: DataClass
    let id, displayName: String
    let version: Int
}

// MARK: - DataClass
struct DataClass: Codable {
    let children: [Child]
}

// MARK: - Child
struct Child: Codable {
    let age: Int
    let fkey, fullName, availableRoomsID: String

    enum CodingKeys: String, CodingKey {
        case age, fkey, fullName
        case availableRoomsID = "availableRoomsId"
    }
}
