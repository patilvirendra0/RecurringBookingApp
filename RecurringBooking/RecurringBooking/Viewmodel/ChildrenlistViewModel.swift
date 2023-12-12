//
//  ChildrenlistViewModel.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation



class ChildrenlistViewModel : ObservableObject {
    
    private let childrenListResource: ChildrenListResource = ChildrenListResource()
    
    var getavailbleroomID: String = String()
        
    @Published var childata: [Child] = []

    
    //Call the api
    func getchildrenList() {
        
        childrenListResource.authenticate() { response in

            DispatchQueue.main.async {
                 if(response != nil){
                     
                     self.childata = (response?.data.children)!
                    //print("Get children List --->\(response.debugDescription)")
                }
            }
        }
    }
}


