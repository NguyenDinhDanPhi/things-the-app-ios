//
//  ContentView.swift
//  Things The App
//
//  Created by dan phi on 20/07/2023.
//

import SwiftUI

struct MainView: View {
    @State private var selectedItems: Set<User> = []
    @State private var selectedIndex: Int?
    @ObservedObject var netWorking = NetworkingManager()
    @State var isSelected = false
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

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
            List(netWorking.users) { user in
                LoginUserRow(title: user.login, isSelected: self.selectedItems.contains(user)) {
                    if self.selectedItems.contains(user) {
                        self.selectedItems.remove(user)
                    } else {
                        self.selectedItems.insert(user)
                    }
                }
                .padding(1)
                .listRowSeparator(.hidden)

            }
            .frame(height: 400)
            .scrollContentBackground(.visible)
            .listStyle(PlainListStyle())
            .scrollIndicators(.hidden)
            .onAppear {
                netWorking.fetchData()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
struct LoginUserRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Spacer()
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.accentColor)
                }
            }
            .padding()
            .contentShape(Rectangle())
        }
        .frame(width: UIScreen.main.bounds.width/1.1,height: 60)
        .background(.orange)
        .cornerRadius(10)
    }
}
