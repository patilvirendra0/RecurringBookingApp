//
//  Resource.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation


struct ChildrenListResource {

    func authenticate(completionHandler:@escaping(_ result: ChildrenlistModel?)->Void) {

        var urlRequest = URLRequest(url: URL(string: APIUtility.childrenListAPI)!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(APIUtility.getacesstoken, forHTTPHeaderField: "x-collection-access-token")

        HttpUtility.shared.getData(request: urlRequest, resultType: ChildrenlistModel.self) { response in
            _ = completionHandler(response)
        }
    }
}
