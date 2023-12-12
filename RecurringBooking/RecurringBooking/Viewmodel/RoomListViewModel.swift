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
     @Published var bookingRooms: [BookingRoom] = []

    //Call the api
    func getroomListData() {
        
        roomListresource.getroomlistapirespnce() { response in
            DispatchQueue.main.async {
                if(response != nil){
                    
                    self.roomlistModel = response.self
                    self.bookingRooms = (response?.data.bookingRooms)!
                    print("Get Room List --->\(response.debugDescription)")
                }
            }
        }
    }
    
    
//    func formattedTime(selectedTime : String ) -> String {
//        
//           let formatter = DateFormatter()
//           formatter.timeStyle = .short
//           
//        return formatter.string(from: selectedTime)
//    }
    
//    func convertToDate() -> Date {
//           let formatter = DateFormatter()
//           formatter.dateFormat = "HH:mm:ssz" // Adjust the date format based on your input string
//           if let date = formatter.date(from: dateString) {
//               return date
//           } else {
//               // Handle invalid date string
//               return Date()
//           }
       //}
}
