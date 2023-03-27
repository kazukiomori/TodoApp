//
//  CategoryImages.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

struct CategoryImages: View {
    
    // MARK: Property
    var category: TodoEntity.Category
    
    // MARK: Initializer
    init(category: TodoEntity.Category) {
        self.category = category ?? .ImpUrg_1st
    }
    
    // MARK: Body
    var body: some View {
        Image(systemName: category.image())
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .padding(2.0)
            .frame(width: 30, height: 30)
            .background(category.color())
            .cornerRadius(6.0)
    }
}

// MARK: Preview
struct CategoryImages_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImages(category: TodoEntity.Category.ImpUrg_1st)
    }
}
