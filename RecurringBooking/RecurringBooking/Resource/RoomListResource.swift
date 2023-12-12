//
//  RoomListResource.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation

struct RoomListResource {
    
        
    
    func getroomlistapiresponse(completionHandler:@escaping(_ result: RoomlistModel?)->Void) {

        var urlRequest = URLRequest(url: URL(string: APIUtility.roomlistAPI)!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(APIUtility.getacesstoken, forHTTPHeaderField: "x-collection-access-token")

        HttpUtility.shared.getData(request: urlRequest, resultType: RoomlistModel.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func createbookingrequest(jsondata:[String : Any],completionHandler:@escaping(_ result: CreaterequestModel?)->Void) {
        
        let body = ["collectionId": APIUtility.collectionaccesstoken ,
                    "jsonData" : jsondata] as [String : Any]
        
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )
        
        var urlRequest = URLRequest(url: URL(string: APIUtility.roomlistAPI)!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue(APIUtility.getacesstoken, forHTTPHeaderField: "x-collection-access-token")
        urlRequest.httpBody = bodyData

        HttpUtility.shared.getData(request: urlRequest, resultType: CreaterequestModel.self) { response in
            _ = completionHandler(response)
        }
    }
}
