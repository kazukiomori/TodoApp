//
//  EditTask.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/29.
//

import SwiftUI

struct EditTask: View {
    // MARK: Property
    @ObservedObject var todo: TodoEntity
    var categories: [TodoEntity.Category]
    = [.ImpUrg_1st, .ImpNUrg_2nd, .NImpUrg_3rd, .NImpNUrg_4th]
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: Function
    fileprivate func save() {
        do {
            try self.viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    fileprivate func delete() {
        self.viewContext.delete(todo)
        save()
    }
    
    // MARK: Body
    var body: some View {
        Form {
            Section(header: Text("タスク").foregroundColor(.secondary)) {
                TextField("タスクを入力", text: Binding($todo.task, "new task" ))
            }
            Section(header: Toggle(isOn: Binding(isNotNil: $todo.time, defaultValue: Date())) {Text("時間を指定する").foregroundColor(.secondary)}) {
                if todo.time != nil {
                    DatePicker(selection: Binding($todo.time, Date()), label: {Text("日時")})
                        .datePickerStyle(.wheel)
                } else {
                    Text("時間未設定").foregroundColor(.secondary)
                }
                
            }
            Picker(selection: $todo.category, label: Text("種類").foregroundColor(.black)) {
                ForEach(categories, id: \.self) { category in
                    HStack {
                        CategoryImages(category: category)
                        Text(category.toString())
                            .foregroundColor(.black)
                    }.tag(category.rawValue)
                }
            }.pickerStyle(.navigationLink)
            Section(header: Text("操作").foregroundColor(.secondary)) {
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                        Text("Delete")
                    }.foregroundColor(.red)
                }
            }
        }.navigationBarTitle("タスクの編集")
            .navigationBarItems(trailing: Button(action: {
                
                self.save()
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("閉じる")})
    }
}


struct EditTask_Previews: PreviewProvider {
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    static var previews: some View {
        let newTodo = TodoEntity(context: context)
        return NavigationView {
            EditTask(todo: newTodo)
                .environment(\.managedObjectContext, context)
        }
    }
}
