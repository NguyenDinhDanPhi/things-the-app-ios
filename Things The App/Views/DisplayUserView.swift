//
//  DisplayUserView.swift
//  Things The App
//
//  Created by dan phi on 21/07/2023.
//

import SwiftUI

struct DisplayUserView: View {
    var userChosen: [User] = [User(login: "madaidesodai1"), User(login: "madaidesodai")]
    @Environment(\.dismiss) var dismiss
    @State private var count = 3
    @State private var isCounting = false
    var body: some View {
        
        let randomIndex = Int.random(in: 0..<userChosen.count)
        return VStack {
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
            HStack(alignment: .top) {   
                List(userChosen) { user in
                    LoginUserRow(title: user.login, isSelected: false) {
                        
                    }
                    .cornerRadius(10)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    
                    
                    
                }
                .frame(width: 200)
                .frame(maxHeight: 400)
                .scrollContentBackground(.visible)
                .listStyle(PlainListStyle())
                .scrollIndicators(.hidden)
                .mask {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [ .white,.clear  ]), startPoint: .top, endPoint: .bottom))

                }

                
                
                VStack(alignment: .center) {
                    Text("Chosen Thing: ")
                        .font(.system(size: 16,weight: .medium))
                        .foregroundColor(.white)
                        .offset(y: -30)
                    if count > 0 {
                        Text("\(count)")
                            .font(.system(size: 29,weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .offset(y: -30)
                        
                    } else {
                        Text(userChosen[randomIndex].login)
                            .font(.system(size: 23,weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .padding(.vertical,20)
                            .opacity(isCounting ? 1.0 : 0.0)
                            .offset(y: -30)
                            
                            

                    }
                }
                .padding()
                .offset(y: 35)
                .frame(width: 168,height: 150)
                .background(.orange)
                .cornerRadius(10)
            }
            .padding()
            .offset(y: 27)
            
            
            
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
                      dismiss()
                    } label: {
                        Text("Back")
                        
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
        .onAppear {
            startCountdown()
        }
    }
    func startCountdown() {
        count = 3
        
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: true) { timer in
            if count > 0 {
                count -= 1
            } else {
                withAnimation {
                    isCounting = true
                }
                timer.invalidate()
            }
        }
    }
}
struct DisplayUserView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayUserView()
    }
}
