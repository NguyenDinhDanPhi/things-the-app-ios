//
//  DisplayUserView.swift
//  Things The App
//
//  Created by dan phi on 21/07/2023.
//

import SwiftUI

struct DisplayUserView: View {
    var userChosen: [User] = [User(login: "haha"), User(login: "hehe")]
    @Environment(\.dismiss) var dismiss
    @State private var count = 3
    @State private var isCounting = false
    var body: some View {
        
        var randomIndex = Int.random(in: 0..<userChosen.count)
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
                .frame(width: 200,height: 450)
                .scrollContentBackground(.visible)
                .listStyle(PlainListStyle())
                .scrollIndicators(.hidden)
                
                
                VStack(alignment: .center) {
                    Text("Chosen Thing: ")
                        .font(.system(size: 16,weight: .medium))
                        .foregroundColor(.white)
                    if count > 0 {
                        Text("\(count)")
                            .font(.system(size: 29,weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.vertical)
                        
                    } else {
                        Text(userChosen[randomIndex].login)
                            .font(.system(size: 23,weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .padding(.vertical)
                            .opacity(isCounting ? 1.0 : 0.0) // Hiệu ứng làm mờ chữ "Go"
                            .animation(.easeIn)
                    }
                }
                .padding()
                .background(.orange)
                .cornerRadius(10)
                .offset(y: 35)
                .frame(width: 150,height: 150)
                
            }
            .offset(y: 15)
            
            
            
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
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if count > 0 {
                count -= 1
            } else {
                withAnimation {
                    isCounting = true // Kích hoạt hiệu ứng làm mờ và hiển thị chữ "Go"
                }
                timer.invalidate() // Dừng timer khi đếm ngược hoàn tất
            }
        }
    }
}
struct DisplayUserView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayUserView()
    }
}
