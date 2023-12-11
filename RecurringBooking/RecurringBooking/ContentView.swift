//
//  ContentView.swift
//  RecurringBooking
//  Created by Virendra Patil on 08/12/23.


import SwiftUI

struct ContentView: View {
    
    @State  var selectedOption: Int = 1
    
    @State  var isOPenchild : Bool = true
    @State var isOPenchooseroom : Bool = false
    @State private var startDate = Date.now
    
    @State private var endDate = Date.now
    
    @State private var buttonDisabled = false
    
    @State private var ChildrenListData : [ChildrenList] = []
    
    let choosedays = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    
    @State var task = [String?]()
    
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
                        ChooseRoomView(isOPenchooseroom: $isOPenchooseroom)
                        
                        VStack (spacing: 0) {
                            
                            HStack (spacing: 10) {
                                
                                VStack {
                                    
                                    HStack{
                                        Text("Start Date").font(.headline).padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        DatePicker(selection: $startDate,in: Date.now..., displayedComponents: .date) {
                                            Label("",systemImage: "calendar").padding(.leading)
                                        }
                                    }.border(Color.gray, width: 1)
                                }
                                
                                VStack{
                                    
                                    HStack{
                                        Text("End Date").font(.headline).padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        DatePicker(selection: $endDate,in: startDate..., displayedComponents: .date) {
                                            Label("",systemImage: "calendar") .padding(.leading)
                                        }
                                        
                                    }.border(Color.gray, width: 1)
                                }
                                
                            }.frame(minWidth: 0, maxWidth: .infinity).background(Color.clear)
                            
                        }.padding()
                        
                        
                        VStack{
                            
                            HStack{
                                Text("Choose days")
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            HStack {
                                
                                ForEach(choosedays.indices, id: \.self) { index in
                                    
                                    if task.contains(choosedays[index]){
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
                                            
                                            if let firstIndex = task.firstIndex(where: {$0 == choosedays[index]}) {
                                                print("Found at index: \(firstIndex)")
                                                task.remove(at: firstIndex)
                                            }
                                        }).background(Color.black)
                                        
                                    } else {
                                        
                                        Divider().frame(height: 40)
                                            .overlay(.black)
                                        
                                        HStack(){
                                            
                                            Text(choosedays[index]).padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                                            
                                        }.frame(height: 40)
                                            .onTapGesture(perform:{
                                                task.append(choosedays[index])
                                            })
                                    }
                                }
                            }.border(Color.gray)
                        }.padding()
                    }
                    
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
                            .background(buttonDisabled ? Color.accentColor : Color.gray )
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            
                        }.padding().disabled(buttonDisabled)
                        
                    }
                }
            }
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
