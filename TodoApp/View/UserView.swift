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
                Text("kazuki")
            }
            Image("profile")
                .resizable()
                .frame(width: 60, height: 60)
                
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
