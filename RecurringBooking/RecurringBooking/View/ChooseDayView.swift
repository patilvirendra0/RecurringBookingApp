//
//  ChooseDayView.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 12/12/23.
//

import SwiftUI

struct ChooseDayView: View {
    
    let choosedays = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    
     @Binding var weekDays : [String]
    
    var body: some View {
        
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
}

//#Preview {
//    ChooseDayView(weekDays: .constant($weekDays))
//}
