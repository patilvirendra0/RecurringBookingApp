//
//  RoomListResource.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation

struct RoomListResource {
    
    func getroomlistapirespnce(completionHandler:@escaping(_ result: RoomlistModel?)->Void) {

        var urlRequest = URLRequest(url: URL(string: APIUtility.baseUrl + "/300b59af-4ec9-4b0b-8213-5ea5cd114a9f")!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(APIUtility.getacesstoken, forHTTPHeaderField: "x-collection-access-token")

        HttpUtility.shared.getData(request: urlRequest, resultType: RoomlistModel.self) { response in
            _ = completionHandler(response)
        }
    }
}
