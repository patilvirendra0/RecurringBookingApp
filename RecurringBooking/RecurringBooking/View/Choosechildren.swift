//
//  Choosechildren.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 09/12/23.
//

import SwiftUI

struct Choosechildren: View {
    
    let newrecurringData = ["Jimmmy jones","Jimmmy jones","Jimmmy jones"]
    
    @State  var selectedOption: Int = 1
    @Binding var isOPenchild : Bool
    
    @ObservedObject var childrenlistViewModel = ChildrenlistViewModel()
    
    
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
                            ForEach(newrecurringData.indices, id: \.self) { index in
                                RadioButtonView(index: index, selectedIndex: $selectedOption, name: newrecurringData[index], isOPenchild: $isOPenchild)
                                    .listRowSeparator(.hidden)
                            }
                        }.listStyle(.plain)
                    }
                }.frame(height: CGFloat(newrecurringData.count) * 45 + 10 )
            }.border(Color.black, width: 1.5).padding()
                .onAppear(){
                    //childrenlistViewModel.getchildrenList()
                }
            
        } else {
            
            //Choose a rooom
            HStack {
                Text("Who").padding()
                Spacer()
                // Text("Jimmy jones").bold().padding()
                Button("Jimmy jones") {
                    isOPenchild = true
                }
                .fontWeight(.bold).foregroundStyle(.black)
                .cornerRadius(0)
                .padding()
                
            }.border(Color.black, width: 1.5).padding()
        }
    }
}

//#Preview {
//    Choosechildren()
//}
