//
//  LoginUserRow.swift
//  Things The App
//
//  Created by dan phi on 21/07/2023.
//

import SwiftUI

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
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.secondary)
                        .frame(width: 25,height: 25)
                        .padding(.trailing,10)
                }
            }
            .frame(height: 50)
            .contentShape(Rectangle())
        }
        .background(.orange)
    }}

struct LoginUserRow_Previews: PreviewProvider {
    static var previews: some View {
        LoginUserRow(title: "Test", isSelected: true) {
            print("hee")
        }
    }
}
