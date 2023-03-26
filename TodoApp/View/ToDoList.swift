//
//  ToDoList.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/27.
//

import SwiftUI

struct ToDoList: View {
    
    // MARK: Property
    let category: TodoEntity.Category
    
    // MARK: Body
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
// MARK: Preview
struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList(category: .ImpUrg_1st)
    }
}
