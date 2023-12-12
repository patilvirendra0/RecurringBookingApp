//
//  RoomListViewModel.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 11/12/23.
//

import Foundation

class RoomlistViewModel : ObservableObject {
    
     private let roomListresource: RoomListResource = RoomListResource()
  
     @Published var bookingRooms: [BookingRoom] = []

    //Call the api
    func getroomListData() {
        
        roomListresource.getroomlistapirespnce() { response in
            DispatchQueue.main.async {
                if(response != nil){
                    
                    self.bookingRooms = []
                    self.bookingRooms = (response?.data.bookingRooms)!
                    print("Get Room List --->\(response.debugDescription)")
                }
            }
        }
    }
    
    func convertedamtopm(timeString: String) -> String? {
        
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ssZ"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            guard let date = dateFormatter.date(from: timeString) else {
                return nil
            }
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "ha"
            let formattedTime = dateFormatter.string(from: date)
            return formattedTime
    }
    
}
