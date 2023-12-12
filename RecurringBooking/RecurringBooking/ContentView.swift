//
//  ContentView.swift
//  RecurringBooking
//  Created by Virendra Patil on 08/12/23.


import SwiftUI

struct ContentView: View {
    
    @State  var isOPenchild : Bool = true
    @State var isOPenchooseroom : Bool = false
    @State private var seletedChildrenfullname : String = ""
    @State private var seelctedavailableRoomsId : String = ""
    @State private var childfkey : String = ""

    @State private var selectedroomId : String = ""
    @State private var feefkey : String = ""
    @State private var roomfkey : String = ""
    
    @State private var weekDays : [String] = []
    
    @ObservedObject var roomlistViewModel = RoomlistViewModel()


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
                        ChooseDayView(weekDays: $weekDays).frame(minWidth: 0, idealWidth: .infinity)
                    }
                }.padding()
                
                HStack{
                    //Review Booking Button
                    Button(action: {
                         
                    }) {
                        NavigationLink(destination: ReviewbookingView()) {
                            HStack {
                                Text("Review Booking")
                                    .fontWeight(.regular)
                                    .font(.title2).padding()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(isbuttonEnable()! ? Color.gray : Color.indigo )
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .navigationBarBackButtonHidden(true).onTapGesture {
                                
                                let jsonData  = ["childFkey" : childfkey, "startDate" : "20-12-2024" , "endDate" : "20-12-2024", "feeFkey": feefkey , "roomFkey": roomfkey ,"daysAWeek" : weekDays ] as [String : Any]
                                
                                if isbuttonEnable()! {
                                } else {
                                    roomlistViewModel.createbookingrequest(jsondata: jsonData)
                                }
                            }
                        }
                        .disabled(isbuttonEnable()!)
                        .navigationBarHidden(true)
                        .padding()
                    }.frame(height : 15)
                    
                }.frame(height : 20).padding(.bottom ,10)
            }
        }.navigationBarBackButtonHidden(true)
        
    }
    
    func isbuttonEnable() -> Bool? {
        if seletedChildrenfullname.isEmpty || childfkey.isEmpty || weekDays.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func exampleDate(){
        let tommaorow = Date.now.addingTimeInterval(86400)
        _ = Date.now...tommaorow
    }
}

#Preview {
    ContentView()
}



struct CustomDatePicker: View {
  @Binding var date: Date

  @State private var showPicker: Bool = false
  @State private var selectedDateText: String = "Date"

  private var selectedDate: Binding<Date> {
    Binding<Date>(get: { self.date}, set : {
        self.date = $0
        self.setDateString()
    })
  } // This private var I found… somewhere. I wish I could remember where

  // To take the selected date and store it as a string for the text field
  private func setDateString() {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM dd, yyyy"

    self.selectedDateText = formatter.string(from: self.date)
  }

  var body: some View {
    VStack {
        HStack {
            Text("Date:")
                .frame(alignment: .leading)
            
            TextField("", text: $selectedDateText)
                .onAppear() {
                    self.setDateString()
                }
                .disabled(true)
                .onTapGesture {
                    self.showPicker.toggle()
                }
            .multilineTextAlignment(.trailing)
        }
        
        if showPicker {
            DatePicker("", selection: selectedDate,
            displayedComponents: .date)
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
        }
    }
  }
}
