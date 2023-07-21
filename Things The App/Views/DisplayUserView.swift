//
//  DisplayUserView.swift
//  Things The App
//
//  Created by dan phi on 21/07/2023.
//

import SwiftUI

struct DisplayUserView: View {
    @ObservedObject var netWorking = NetworkingManager()

    var body: some View {
        VStack {
            ZStack{
                Image("background")
                    .resizable()
                    .colorMultiply(.orange)
                    .frame(width: UIScreen.main.bounds.width,height: 150)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -75)
                    .scaleEffect(x:2.9, y: 2.5)
                
                
                HStack {
                    Text("THINGS \n The Apps")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading,10)
                    Spacer()
                }
            }
            Spacer()
            HStack {
                List(netWorking.users) { user in
                    LoginUserRow(title: user.login, isSelected: false) {
                     
                    }
                    .cornerRadius(10)
                    .listRowSeparator(.hidden)

                    
                }
                .frame(width: 230,height: 400)
                .scrollContentBackground(.visible)
                .listStyle(PlainListStyle())
                .scrollIndicators(.hidden)
                Spacer()
            }
            
            Spacer()
            ZStack {
                Image("background")
                    .resizable()
                    .colorMultiply(.orange)
                    .frame(width: UIScreen.main.bounds.width,height: 150)
                    .offset(x: 75)
                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                    .scaleEffect(x:2.9, y: 2.5)
                
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Next")
                        
                    }
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 180)
                    .background(.brown)
                    .cornerRadius(10)
                }
                .padding()
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct DisplayUserView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayUserView()
    }
}
