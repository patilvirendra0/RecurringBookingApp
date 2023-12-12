//
//  ChooseRoomView.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 09/12/23.
//

import Foundation

import SwiftUI

struct ChooseRoomView: View {
    
    @State  var selectedchooseroom : Int = 1
    @Binding var isOPenchooseroom : Bool
    @ObservedObject var roomlistViewModel = RoomlistViewModel()
    
    var body: some View {
        
        if isOPenchooseroom {
            
            VStack {
                HStack{
                    Text("Choose a room ").font(.headline).padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 0))
                    Spacer()
                }
                
                VStack{
                    HStack {
                        List{
                            
                            ForEach(roomlistViewModel.bookingRooms.indices, id: \.self) { index in
                                Button(action: {
                                    selectedchooseroom = index
                                    isOPenchooseroom = false
                                }) {
                                    HStack {
                                        
                                        Image(systemName: selectedchooseroom == index ? "largecircle.fill.circle" : "circle")
                                            .foregroundColor(.black)
                                        Text("\(roomlistViewModel.bookingRooms[index].roomName + " - " +   "\(String(describing: roomlistViewModel.convertedamtopm(timeString: roomlistViewModel.bookingRooms[index].startTime)!))" + " - " + "\(String(describing: roomlistViewModel.convertedamtopm(timeString: roomlistViewModel.bookingRooms[index].endTime)!))")")
                                            .foregroundStyle(.black)
                                            .font(.system(size: 14, weight: .regular, design: .default))
                                    }
                                }.listRowSeparator(.hidden)
                            }.id(UUID())
                        }
                        .listStyle(.plain)
                    }
                }.frame(height: CGFloat(roomlistViewModel.bookingRooms.count) * 45 + 10 )
            }.border(Color.black, width: 1.5).onAppear() {
                
                  roomlistViewModel.bookingRooms = []
                  roomlistViewModel.getroomListData()
            }
            
        } else {
            
            //Choose a rooom
            HStack {
                
                Text("Where").padding()
                Spacer()
                Button((roomlistViewModel.bookingRooms.count != 0 ? roomlistViewModel.bookingRooms[selectedchooseroom].roomName + " - " +   "\(String(describing: roomlistViewModel.convertedamtopm(timeString: roomlistViewModel.bookingRooms[selectedchooseroom].startTime)!))" + " - " + "\(String(describing: roomlistViewModel.convertedamtopm(timeString: roomlistViewModel.bookingRooms[selectedchooseroom].endTime)!))"
                        : "Choose a room")) {
                    isOPenchooseroom = true
                }
                .foregroundStyle(.black)
                .font(.system(size: 15, weight: .semibold, design: .default))
                .cornerRadius(0)
                .padding()
                
            }.border(Color.black, width: 1.5)
        }
    }
}

