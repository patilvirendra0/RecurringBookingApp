//
//  ChildrenlistViewModel.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation


class ChildrenlistViewModel : ObservableObject {
    
    private let childrenListResource: ChildrenListResource = ChildrenListResource()
    
    //Call the api
    func getchildrenList() {
        
        childrenListResource.authenticate() { response in

            DispatchQueue.main.async {
                 if(response != nil){
                    print("Get children List --->\(response.debugDescription)")
                }
            }
        }
    }
}


