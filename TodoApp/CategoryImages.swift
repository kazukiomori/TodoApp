//
//  CategoryImages.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

struct CategoryImages: View {
    var body: some View {
        Image(systemName: "tortoise.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .padding(2.0)
            .frame(width: 30, height: 30)
            .background(Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)))
            .cornerRadius(6.0)
    }
}

struct CategoryImages_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImages()
    }
}
