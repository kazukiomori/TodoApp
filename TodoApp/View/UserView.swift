//
//  UserView.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("こんにちは")
                    .foregroundColor(Color.tTitle)
                Text("kazuki")
                    .foregroundColor(Color.tTitle)
            }
            Spacer()
            Image("profile")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
        }
        .padding()
        .background(Color.tBackground)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
