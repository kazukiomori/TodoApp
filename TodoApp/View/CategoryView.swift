//
//  CategoryView.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

struct CategoryView: View {
    // MARK: Property
    var category: TodoEntity.Category
    @State var numberOfTasks = 0
    
    // MARK: Body
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: category.image())
                .font(.largeTitle)
            Text(category.toString())
            Text("・\(numberOfTasks)タスク")
            Button(action: {}) {
                Image(systemName: "plus")
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 150)
        .foregroundColor(.white)
        .background(category.color())
        .cornerRadius(20)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CategoryView(category: .ImpUrg_1st,
                         numberOfTasks: 100)
            CategoryView(category: .ImpNUrg_2nd,
                         numberOfTasks: 100)
            CategoryView(category: .NImpUrg_3rd,
                         numberOfTasks: 100)
            CategoryView(category: .NImpNUrg_4th,
                         numberOfTasks: 100)
        }
    }
}