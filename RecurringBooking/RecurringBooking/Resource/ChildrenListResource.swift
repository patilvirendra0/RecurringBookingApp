//
//  Resource.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation


struct ChildrenListResource {

    func authenticate(completionHandler:@escaping(_ result: ChildrenList?)->Void) {

        let token = "66e627a5-cfff-4a8e-b80f-6f0e572bf476"

        var urlRequest = URLRequest(url: URL(string: "https://api.myjson.online/v1/records/076c0cb9-c60e-48eb-a447-77e85b700d94")!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(token, forHTTPHeaderField: "x-collection-access-token")

        HttpUtility.shared.getData(request: urlRequest, resultType: ChildrenList.self) { response in
            _ = completionHandler(response)
        }
    }
}
