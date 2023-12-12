//
//  ContentView.swift
//  RecurringBooking
//  Created by Virendra Patil on 08/12/23.


import SwiftUI

struct ContentView: View {
    
    
    @State  var isOPenchild : Bool = true
    @State var isOPenchooseroom : Bool = false
    
    @State private var startDate = Date.now
    
    @State private var endDate = Date.now
    
    @State private var buttonDisabled = false
    
    let choosedays = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    
    @State var weekDays = [String?]()
    
//    @ObservedObject var roomlistViewModel = RoomlistViewModel()

    
    var dateformater : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
    
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
                        Choosechildren(isOPenchild: $isOPenchild)
                        
                        //set the Choose room Data
                        ChooseRoomView(isOPenchooseroom: $isOPenchooseroom).padding(.top,10)
                        
                        VStack  {
                            
                            HStack (spacing: 5) {
                                
                                VStack {
                                    
                                    HStack{
                                        Text("Start Date").font(.headline).padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        DatePicker(selection: $startDate,in: Date.now..., displayedComponents: .date) {
                                            Label("",systemImage: "calendar")
                                        }.padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 10))
                                        
                                    }.border(Color.gray, width: 1)
                                }
                                
                                VStack{

                                    HStack{
                                        Text("End Date").font(.headline).padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                        Spacer()
                                    }

                                    HStack {
                                        DatePicker(selection: $endDate,in: startDate..., displayedComponents: .date) {
                                            Label("",systemImage: "calendar")
                                        }.padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 10))
                                        
                                    }.border(Color.gray, width: 1)
                                }
                            }.background(Color.clear)
                            
                            
                            
                        }.padding(.top,15)
                        
                        
                        
                        VStack{
                            
                            HStack{
                                Text("Choose days")
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            
                            HStack {
                                
                                ForEach(choosedays.indices, id: \.self) { index in
                                    
                                    if weekDays.contains(choosedays[index]){
                                        Divider().frame(height: 40)
                                            .overlay(.black)
                                        HStack(){
                                            
                                            Text(choosedays[index])
                                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                                                .background(Color.black)
                                                .foregroundStyle(.white)
                                                .fontWeight(.bold)
                                        }
                                        .onTapGesture(perform:{
                                            
                                            if let firstIndex = weekDays.firstIndex(where: {$0 == choosedays[index]}) {
                                                print("Found at index: \(firstIndex)")
                                                weekDays.remove(at: firstIndex)
                                            }
                                        }).background(Color.red)
                                        
                                    } else {
                                        
                                        Divider().frame(height: 40)
                                            .overlay(.black)
                                        
                                        HStack(){
                                            
                                            Text(choosedays[index]).padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                                            
                                        }.frame(height: 40)
                                            .onTapGesture(perform:{
                                                weekDays.append(choosedays[index])
                                            })
                                    }
                                }
                            }.border(Color.gray).frame(minWidth: 0,maxWidth: .infinity)
                            
                        }.padding(.top,10)
                    }
                    
                }.padding()
                
                HStack{
                    //Review Booking Button
                    Button(action: {
                        print("Delete tapped!")
                        buttonDisabled = true
                    }) {
                        NavigationLink(destination: ReviewbookingView()) {
                            HStack {
                                Text("Review Booking")
                                    .fontWeight(.regular)
                                    .font(.title2).padding()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(buttonDisabled ? Color.indigo : Color.gray )
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
