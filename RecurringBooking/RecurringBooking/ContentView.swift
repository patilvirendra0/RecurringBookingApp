//
//  ContentView.swift
//  RecurringBooking
//  Created by Virendra Patil on 08/12/23.


import SwiftUI

struct ContentView: View {
    
    
    @State var selectedOption: Int = 1
    
    let newrecurringData = ["Jimmy jones","Jake Jones","Jimmy jones","Jake Jones","Jimmy jones","Jake Jones"]
    
    var body: some View {
        
        //Vertical line and Text
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
        
        //Added the Radio button View
        HStack {
            List{
                Text("Who's going?").font(.headline)
                ForEach(newrecurringData.indices, id: \.self) { index in
                    RadioButtonView(index: index, selectedIndex: $selectedOption, name: newrecurringData[index])
                    
                }
            }.border(Color.black, width: 2)
        }.padding()
        
        //choose a rooom
        HStack {
            Text("Who").padding()
            Spacer()
            Text("Jimmy jones").bold().padding()

        }.border(Color.black, width: 2).padding()
        
        
        //choose a rooom
        HStack {
            Text("Where").padding()
            Spacer()
            Text("Choose a room ").bold().padding()

        }.border(Color.black, width: 2).padding()
        
        VStack{
            HStack {
                Text("Start Date")
                Spacer()
                Text("End Date")
            }
            
        HStack {
                HStack {
                    Image(systemName: "calendar").padding()
                    Text("Date").padding()
                }.border(Color.black, width: 2)
              
                Spacer()
                
                HStack {
                    Image(systemName: "calendar").padding()
                    Text("Date").padding()

                }.border(Color.black, width: 2)
         }
     }.padding()
        
        


        
       
        
        
    }
}

#Preview {
    ContentView()
}

struct RadioButtonView: View {
    
    var index: Int
    @Binding var selectedIndex: Int
    var name : String
    
    var body: some View {
        Button(action: {
            selectedIndex = index
            print(selectedIndex)
        }) {
        
        HStack {
                Image(systemName: selectedIndex == index ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.black)
                Text("\(name)")
            }
        }
    }
}
