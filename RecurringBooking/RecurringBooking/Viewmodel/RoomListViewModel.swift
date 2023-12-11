//
//  RoomListViewModel.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation

class RoomlistViewModel : ObservableObject {
    
    private let roomListresource: RoomListResource = RoomListResource()
  
     @Published var roomlistModel: RoomlistModel?
    
    //Call the api
    func getroomListData() {
        
        roomListresource.getroomlistapirespnce() { response in
            DispatchQueue.main.async {
                if(response != nil){
                    
                    self.roomlistModel = response.self
                    //print("Get Room List --->\(response.debugDescription)")
                }
            }
        }
    }
}
