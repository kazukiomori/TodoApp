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
    @Binding var showList: Bool
    
    // MARK: Function
    fileprivate func addNewTask() {
        if newTask == "" {
            messageAlert.shared.showErrorMessage(title: "エラー", body: "タスクが入力されていません")
            return
        }
        TodoEntity.create(in: self.viewContext,
                          category: self.category,
                          task: self.newTask)
        messageAlert.shared.showSuccessMessage(title: "成功", body: "タスクの保存が完了しました。")
        self.newTask = ""
        showList = false
    }
    
    fileprivate func cancelTask() {
        self.newTask = ""
        showList = false
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
            .foregroundColor(.black)
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
        QuickNewTask(category: .ImpUrg_1st, showList: .constant(true))
            .environment(\.managedObjectContext, container.viewContext)
    }
}
