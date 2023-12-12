//
//  ContentView.swift
//  RecurringBooking
//  Created by Virendra Patil on 08/12/23.


import SwiftUI

struct ContentView: View {
    
    @State  var isOPenchild : Bool = true
    @State var isOPenchooseroom : Bool = false
    @State private var buttonDisabled = false
    @State private var seletedChildrenfullname : String = ""
    @State private var seelctedavailableRoomsId : String = ""
    @State private var childfkey : String = ""

    
    @State private var selectedroomId : String = ""
    @State private var feefkey : String = ""
    @State private var roomfkey : String = ""
    
    @State private var weekDays : [String] = []


    @State var selecteddata = SelectedDataModel()

    var body: some View {
        
        //Vertical line and Text
        NavigationView {
            
            VStack {
                
                VStack {
                    Divider()
                        .frame(height: 4)
                        .overlay(.black)
                }
                .font(.largeTitle)
                .padding(EdgeInsets(top: 40, leading: 1, bottom: 0, trailing: 1))
                
                VStack {
                    Text("New recurring booking").font(.headline)
                }.padding()
                
                
                VStack{
                    ScrollView{
                        
                        //set the Choose room Data
                        Choosechildren(isOPenchild: $isOPenchild, isOPenchooseroom: $isOPenchooseroom, seletedChildrenfullname: $seletedChildrenfullname, selectedavailableRoomsId: $seelctedavailableRoomsId, childfkey: $childfkey)

                        //set the Choose room Data
                        ChooseRoomView(isOPenchooseroom: $isOPenchooseroom,feefkey: $feefkey,roomfkey:$roomfkey, selectedroomname: "Choose Rooom")
                            .padding(.top,10)
                        
                        //Choose DatePicker
                        ChooseDateView()
                        
                        //Choose Day Week
                        ChooseDayView(weekDays: $weekDays)
                    }
                }.padding()
                
                HStack{
                    //Review Booking Button
                    Button(action: {
                        buttonDisabled = true
                    }) {
                        NavigationLink(destination: ReviewbookingView()) {
                            HStack {
                                Text("Review Booking")
                                    .fontWeight(.regular)
                                    .font(.title2).padding()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(seletedChildrenfullname.isEmpty || childfkey.isEmpty || weekDays.isEmpty ? Color.gray : Color.indigo )
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .navigationBarBackButtonHidden(true)
                            
                        }
                        .disabled(buttonDisabled)
                        .navigationBarHidden(true)
                        .padding()
                    }.frame(height : 15)
                    
                }.frame(height : 20).padding(.bottom ,10)

            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func exampleDate(){
        let tommaorow = Date.now.addingTimeInterval(86400)
        _ = Date.now...tommaorow
    }
}

#Preview {
    ContentView()
}
