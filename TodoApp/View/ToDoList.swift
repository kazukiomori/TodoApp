//
//  ToDoList.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/27.
//

import SwiftUI
import CoreData

struct ToDoList: View {
    
    // MARK: Property
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.time,
                                           ascending: true)],
        animation: .default)
    var todoList: FetchedResults<TodoEntity>
    
    let category: TodoEntity.Category
    
    // MARK: Body
    var body: some View {
        List{
            ForEach(todoList) { todo in
                Text(todo.task ?? "no title")
            }
        }
    }
}
// MARK: Preview
struct ToDoList_Previews: PreviewProvider {
    
    static let persistenceController = PersistenceController.shared
    static var previews: some View {
        ToDoList(category: .ImpUrg_1st)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
