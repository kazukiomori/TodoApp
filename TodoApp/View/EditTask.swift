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
    @State var showingSheet = false
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
            Section(header: Text("task").foregroundColor(.secondary)) {
                TextField(NSLocalizedString("enter_task", comment: ""), text: Binding($todo.task, "new task" ))
            }
            Section(header: Toggle(isOn: Binding(isNotNil: $todo.time, defaultValue: Date())) {Text("set_time").foregroundColor(.secondary)}) {
                if todo.time != nil {
                    DatePicker(selection: Binding($todo.time, Date()), label: {Text("datetime")})
                        .datePickerStyle(.wheel)
                } else {
                    Text("time_unset").foregroundColor(.secondary)
                }
                
            }
            Picker(selection: $todo.category, label: Text("type").foregroundColor(.black)) {
                ForEach(categories, id: \.self) { category in
                    HStack {
                        CategoryImages(category: category)
                        Text(category.toString())
                            .foregroundColor(.black)
                    }.tag(category.rawValue)
                }
            }.pickerStyle(.navigationLink)
            Section(header: Text("operation").foregroundColor(.secondary)) {
                Button(action: {
                    self.showingSheet = true
                }) {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                        Text("delete")
                    }.foregroundColor(.red)
                }
            }
        }.navigationBarTitle(NSLocalizedString("edit_task", comment: ""))
            .navigationBarItems(trailing: Button(action: {
                
                self.save()
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("close")})
            .foregroundColor(.black)
            .actionSheet(isPresented: $showingSheet) {
                ActionSheet(title: Text("delete_task"), message: Text("delete_this_task_are_you_sure"), buttons:[
                    .destructive(Text("delete")) {
                        self.delete()
                        self.presentationMode.wrappedValue.dismiss()
                    },
                    .cancel(Text("cancel"))
                ])
            }
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
