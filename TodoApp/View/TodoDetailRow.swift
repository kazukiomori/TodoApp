//
//  TodoDetailRow.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/28.
//

import SwiftUI

struct TodoDetailRow: View {
    @ObservedObject var todo: TodoEntity
    var body: some View {
        HStack {
            CategoryImages(category: TodoEntity.Category(rawValue: todo.category)!)
            CheckBox(checked: Binding(get: {
                self.todo.state == TodoEntity.State.done.rawValue
            }, set: {
                self.todo.state = $0 ? TodoEntity.State.done.rawValue : TodoEntity.State.todo.rawValue
            })
            
            ) {
                Text(self.todo.task ?? "notitle")
            }
        }
    }
}

struct TodoDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let newTodo = TodoEntity(context: context)
        newTodo.task = "将来に向けた勉強"
        newTodo.state = TodoEntity.State.todo.rawValue
        newTodo.category = 0
        return TodoDetailRow(todo: newTodo)
    }
}
