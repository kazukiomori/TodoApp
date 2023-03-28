//
//  QuickNewTask.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

struct QuickNewTask: View {
    
    // MARK: Property
    let category: TodoEntity.Category
    
    @State var newTask: String = ""
    @Environment(\.managedObjectContext) var viewContext
    
    // MARK: Function
    
    fileprivate func addNewTask() {
        TodoEntity.create(in: self.viewContext,
                          category: self.category,
                          task: self.newTask)
        self.newTask = ""
    }
    
    fileprivate func cancelTask() {
        self.newTask = ""
    }
    
    // MARK: Body
    var body: some View {
        HStack {
            TextField("新しいタスク", text: $newTask){
                self.addNewTask()
            }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("追加") {
                self.addNewTask()
            }
            Button("Cancel") {
                self.cancelTask()
            }
            .foregroundColor(.red)
        }
    }
}

// MARK: Preview
struct QuickNewTask_Previews: PreviewProvider {
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    static var previews: some View {
        QuickNewTask(category: .ImpUrg_1st)
            .environment(\.managedObjectContext, container.viewContext)
    }
}
