//
//  ReviewbookingView.swift
//  RecurringBooking
//
//  Created by Virendra Patil on 10/12/23.
//

import SwiftUI

struct ReviewbookingView: View {
    
    var body: some View {
        
        VStack {
            Divider()
                .frame(height: 4)
                .overlay(.black)
        }
        .font(.largeTitle)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        
        VStack {
            Text("New recurring booking").font(.headline)
        }.padding()
        
        
        VStack{
            
            HStack{
                
                Text("Summary").fontWeight(.bold).foregroundStyle(.black).padding(.trailing ,5)
                Spacer()
                
            }
            
            VStack {
                HStack{
                    
                    Image(systemName: "person.crop.circle.fill").frame(width: 40,height: 40)
                    
                    Text("jimmy jones").font(.title3).padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    Spacer()
                }
            }.border(Color.gray, width: 1.5)
            
            
            
            HStack{
                Text("Before school care  -5am -8:30am").fontWeight(.bold).padding(.bottom,10)
                Spacer()
            }.padding(.top ,20 )
            
            HStack{
                
                VStack(alignment: .leading, content: {
                    
                    Text("From 2 Jan 2024")
                    Text("Every Mon,The,Wed")
                    Text("Ends 20 Dec 24").padding(.bottom ,10)
                    
                    Text("Your are booking 158 days").padding(.bottom ,10)
                    
                    Text("Booking Referance number:").fontWeight(.bold)
                    
                    Text("0fewf-ewfwef-fwef-ger-hreh-hehe-")
                    
                })
                Spacer()
            }
            
            Spacer()
            
            VStack {
                
                //Review Booking Button
                Button(action: {
                    
                    
                }) {
                    
                    NavigationLink(destination: ContentView()) {

                        HStack {
                            Text("Change Booking")
                                .fontWeight(.regular)
                                .font(.title3).padding()
                                .navigationBarHidden(true)

                        }
                        .foregroundColor(.blue)
                        .frame(minWidth: 0, maxWidth: .infinity)

                    }.border(Color.gray, width: 1.5)
                        .cornerRadius(1)

                }.padding(.bottom ,5)
                
                
                Button(action: {
                    
                }) {

                        HStack {
                            Text("DONE")
                                .fontWeight(.medium)
                                .font(.title3).padding()
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .border(Color.gray, width: 1.5).cornerRadius(4)
                }
            }.frame(height: 70)
            
        }.padding()
        
    }
}

#Preview {
    ReviewbookingView()
}
