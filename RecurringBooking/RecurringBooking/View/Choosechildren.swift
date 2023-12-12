//
//  Choosechildren.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 09/12/23.
//

import SwiftUI

struct Choosechildren: View {
        
    @State var selectedOption: Int = 1
    @Binding var isOPenchild : Bool
    @Binding var isOPenchooseroom : Bool
    @Binding var seletedChildrenfullname : String
    @Binding var selectedavailableRoomsId : String
    @Binding var childfkey : String


    @ObservedObject var childlistViewModel = ChildrenlistViewModel()
    @ObservedObject var roomlistViewModel = RoomlistViewModel()
    
    var body: some View {
        
        if isOPenchild {
            VStack {
                HStack{
                    Text("Who's going?").font(.headline).padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 0))
                    Spacer()
                }
                VStack{
                    HStack {
                        List{
                            ForEach(childlistViewModel.childata.indices, id: \.self) { index in
                                Button(action: {
                                    
                                    isOPenchild = false
                                    isOPenchooseroom = true
                                    selectedOption = index
                                    APIUtility.availbleroomID = childlistViewModel.childata[index].availableRoomsID
                                    seletedChildrenfullname = childlistViewModel.childata[index].fullName
                                    selectedavailableRoomsId = childlistViewModel.childata[index].availableRoomsID
                                    childfkey = childlistViewModel.childata[index].fkey
                                    
                                    roomlistViewModel.bookingRooms = []
                                    roomlistViewModel.getroomListData()
                         
                                }) {
                                    HStack {
                                        Image(systemName: selectedOption == index ? "largecircle.fill.circle" : "circle")
                                            .foregroundColor(.black)
                                        Text("\(childlistViewModel.childata[index].fullName)").fontWeight(.regular).foregroundStyle(.black)
                                    }
                                }.listRowSeparator(.hidden)
                            }
                        }.listStyle(.plain)
                    }
                }.frame(height: CGFloat(childlistViewModel.childata.count) * 45 + 10)
                
            }.border(Color.black, width: 1.5)
                .onAppear() {
                    childlistViewModel.getchildrenList()
                }
        } else {

            //Choose a rooom
            HStack {
                Text("Who").padding()
                 Spacer()
                Button(seletedChildrenfullname) {
                    isOPenchild = true
                }
                .foregroundStyle(.black)
                .font(.system(size: 15, weight: .semibold, design: .default))
                .cornerRadius(0)
                .padding()
                
            }.border(Color.black, width: 1.5)
        }
    }
}

//#Preview {
//    Choosechildren(isOPenchild: .constant(false), isOPenchooseroom: .constant(false), SeletedChildrenfullname: .constant(false))
//}
