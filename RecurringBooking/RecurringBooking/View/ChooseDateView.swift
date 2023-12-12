//
//  ChooseDateView.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 12/12/23.
//

import SwiftUI

struct ChooseDateView: View {
    
    @State private var startDate = Date.now
    @State private var endDate = Date.now
    
    @State private var showPicker: Bool = false

    @State private var selectedDateText: String = "Date"

//    private var selectedDate: Binding<Date> {
//      Binding<Date>(get: { startDate}, set : {
//          self.startDate = $0
//          self.setDateString()
//      })
//    }
    
//    private func setDateString() {
//      let formatter = DateFormatter()
//      formatter.dateFormat = "dd/MM/yyyy"
//      self.selectedDateText = formatter.string(from: startDate)
//    }
    
    var body: some View {
        
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
    }
}

#Preview {
    ChooseDateView()
}
