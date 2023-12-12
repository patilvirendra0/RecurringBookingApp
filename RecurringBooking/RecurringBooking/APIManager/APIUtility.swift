//
//  APIUtility.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation


struct APIUtility {
    
    static var getacesstoken =  "66e627a5-cfff-4a8e-b80f-6f0e572bf476"
    static var collectionaccesstoken = "cd0e99a7-6069-403e-b085-0fabaa1a242c"
    
    static var baseUrl = "https://api.myjson.online/v1/records/"
  

    static var availbleroomID = ""
    static var childrenListAPI  = baseUrl + "076c0cb9-c60e-48eb-a447-77e85b700d94"
    static var roomlistAPI =  baseUrl + availbleroomID
    static var createbookingrequest = "https://api.myjson.online/v1/records"
    
}
