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
                                
                                ChooseroomRadiobutton(index: index, selectedIndex: $selectedchooseroom, name: roomlistViewModel.bookingRooms[index].roomName + " - " + roomlistViewModel.bookingRooms[index].startTime + " - " + roomlistViewModel.bookingRooms[index].endTime  , isOPenchild: $isOPenchooseroom)
                                    .listRowSeparator(.hidden)
                            }
                        }.listStyle(.plain)
                    }
                }.frame(height: CGFloat(roomlistViewModel.bookingRooms.count) * 45 + 10 )
            }.border(Color.black, width: 1.5).onAppear() {
                
                  roomlistViewModel.getroomListData()
            }
            
        } else {
            
            //Choose a rooom
            HStack {
                Text("Where").padding()
                Spacer()
                Button((roomlistViewModel.roomlistModel?.data.bookingRooms[selectedchooseroom].roomName ?? "Choose a room")) {
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

struct ChooseroomRadiobutton: View {
    
    var index: Int
    @Binding var selectedIndex: Int
    @State var name : String
    @Binding var isOPenchild : Bool

    @ObservedObject var roomlistViewModel = RoomlistViewModel()
        
    var body: some View {
        
        Button(action: {
            selectedIndex = index
            isOPenchild = false

        }) {
            HStack {
                Image(systemName: selectedIndex == index ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.black)
                Text("\(name)")
                    .foregroundStyle(.black)
                    .font(.system(size: 14, weight: .regular, design: .default))
            }
        }
    }
}
