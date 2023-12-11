//
//  ChooseRoomView.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 09/12/23.
//

import Foundation

import SwiftUI

struct ChooseRoomView: View {
    
    
    var chooseroomdata = ["Before School care - 5am - 8:30am","holiday Program - 9am - 3pm","Before School care - 5am - 8:30am","holiday Program - 9am - 3pm","Before School care - 5am - 8:30am"]
    
    @State  var selectedOption: Int = 1
    
    @Binding var isOPenchooseroom : Bool
    
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
                            
                            ForEach(chooseroomdata.indices, id: \.self) { index in
                                
                                RadioButtonView(index: index, selectedIndex: $selectedOption, name: chooseroomdata[index], isOPenchild: $isOPenchooseroom)
                                    .listRowSeparator(.hidden)
                            }
                        }.listStyle(.plain)
                    }
                }.frame(height: CGFloat(chooseroomdata.count) * 45 + 10 )
            }.border(Color.black, width: 1.5).padding()
            
        } else {
            
            //Choose a rooom
            HStack {
                Text("Where").padding()
                Spacer()
                // Text("Jimmy jones").bold().padding()
                Button("Before School care - 5am - 8:30am") {
                    isOPenchooseroom = true
                }
                .fontWeight(.bold).foregroundStyle(.black)
                .cornerRadius(0)
                .padding()
                
            }.border(Color.black, width: 1.5).padding()
        }
    }
}
