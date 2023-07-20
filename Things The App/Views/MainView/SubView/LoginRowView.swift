//
//  LoginRowView.swift
//  Things The App
//
//  Created by dan phi on 20/07/2023.
//

import SwiftUI

struct LoginRowView: View {
    let title: String
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
               

        }
        .frame(width: UIScreen.main.bounds.width/1.1,height: 60)
        .background(.orange)
        .cornerRadius(10)
        

    }
}

struct LoginRowView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRowView(title: "test")
            .previewLayout(.sizeThatFits)
    }
}
