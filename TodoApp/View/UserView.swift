//
//  UserView.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

struct UserView: View {
    
    // MARK: Property
    let image: Image
    let userName: String
    
    // MARK: Body
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("こんにちは")
                    .foregroundColor(Color.tTitle)
                    .font(.footnote)
                Text("\(userName)")
                    .foregroundColor(Color.tTitle)
                    .font(.title)
            }
            Spacer()
            self.image
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
        }
        .padding()
        .background(Color.tBackground)
    }
}

// MARK: Preview
struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(image: Image("profile"), userName: "userName")
    }
}
