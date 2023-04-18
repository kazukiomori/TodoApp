//
//  NewTask.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/29.
//

import SwiftUI

struct NewTask: View {
    
    // MARK: Property
    @State var task: String = ""
    @State var time: Date? = Date()
    @State var category: Int16 = TodoEntity.Category.ImpUrg_1st.rawValue
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
    // MARK: Body
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("task").foregroundColor(.secondary)) {
                    TextField(NSLocalizedString("enter_task", comment: ""), text: $task)
                        .foregroundColor(Color.black)
                }
                Section(header: Toggle(isOn: Binding(isNotNil: $time, defaultValue: Date())) {Text("set_time").foregroundColor(.secondary)}) {
                    if time != nil {
                        DatePicker(selection: Binding($time, Date()), label: {Text("datetime")})
                            .datePickerStyle(.wheel)
                    } else {
                        Text("time_unset").foregroundColor(.secondary)
                    }
                    
                }
                Picker(selection: $category, label: Text("type").foregroundColor(.black)) {
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
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "minus.circle.fill")
                            Text("cancel")
                        }.foregroundColor(.red)
                    }
                }
            }.navigationBarTitle(NSLocalizedString("addTask", comment: ""))
                .navigationBarItems(trailing: Button(action: {
                    if task == "" {
                        messageAlert.shared.showErrorMessage(title: NSLocalizedString("error", comment: ""), body: NSLocalizedString("noTaskHasBeenEntered", comment: ""))
                        return
                    }
                    TodoEntity.create(in: self.viewContext,
                                      category: TodoEntity.Category(rawValue: self.category) ?? .ImpUrg_1st,
                                      task: self.task,
                                      time: self.time)
                    messageAlert.shared.showSuccessMessage(title: NSLocalizedString("success", comment: ""), body: NSLocalizedString("theTaskHasBeenSaved", comment: ""))
                    self.save()
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("save")})
                .foregroundColor(.blue)
        }
    }
}

// MARK: Preview
struct NewTask_Previews: PreviewProvider {
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    static var previews: some View {
        NewTask()
            .environment(\.managedObjectContext, context)
    }
}
