//
//  RoomListResource.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation

struct RoomListResource {
    
    func getroomlistapirespnce(completionHandler:@escaping(_ result: RoomlistModel?)->Void) {

        var urlRequest = URLRequest(url: URL(string: APIUtility.roomlistAPI)!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(APIUtility.getacesstoken, forHTTPHeaderField: "x-collection-access-token")

        HttpUtility.shared.getData(request: urlRequest, resultType: RoomlistModel.self) { response in
            _ = completionHandler(response)
        }
    }
}
