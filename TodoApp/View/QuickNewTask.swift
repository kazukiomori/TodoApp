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
    
    // MARK: Function
    
    fileprivate func addNewTask() {
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
    static var previews: some View {
        QuickNewTask(category: .ImpUrg_1st)
    }
}
