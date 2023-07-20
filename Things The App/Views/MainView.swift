//
//  ContentView.swift
//  Things The App
//
//  Created by dan phi on 20/07/2023.
//

import SwiftUI

struct MainView: View {
  @State  var data = ["Hello, world!", "This", "is", "a list view.","1","2"]
    
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
            List {
                ForEach(data, id: \.self) { i in
                    LoginRowView(test: i)
                        .listRowSeparator(.hidden)
                        .padding(1)
                    
                }
                
            }
            .frame(height: 400)
            .listStyle(PlainListStyle())
            .scrollIndicators(.hidden)
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
