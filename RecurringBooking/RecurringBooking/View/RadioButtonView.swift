//
//  RadioButtonView.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 09/12/23.
//

import SwiftUI

struct RadioButtonView: View {
    
    var index: Int
    @Binding var selectedIndex: Int
    var name : String
    @Binding var isOPenchild : Bool
    
    var body: some View {
        
        Button(action: {
            selectedIndex = index
            isOPenchild = false
        }) {
            
            HStack {
                Image(systemName: selectedIndex == index ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.black)
                Text("\(name)").fontWeight(.regular).foregroundStyle(.black)
            }
        }
    }
}

