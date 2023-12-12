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
                                RadioButtonView(index: index, selectedIndex: $selectedOption, name: childlistViewModel.childata[index].fullName, isOPenchild: $isOPenchild)
                                    .listRowSeparator(.hidden)
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
                Button(childlistViewModel.childata[selectedOption].fullName) {
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
//    Choosechildren()
//}
