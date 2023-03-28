//
//  NewTask.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/29.
//

import SwiftUI

struct NewTask: View {
    @State var task: String = ""
    @State var time: Date? = Date()
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("タスク")) {
                    TextField("タスクを入力", text: $task)
                }
                Section(header: Toggle(isOn: Binding(isNotNil: $time, defaultValue: Date())) {Text("時間を指定する")}) {
                    if time != nil {
                        DatePicker(selection: Binding($time, Date()), label: {Text("日時")})
                            .datePickerStyle(.wheel)
                    } else {
                        Text("時間未設定").foregroundColor(.secondary)
                    }
                    
                }
                Section(header: Text("操作")) {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "minus.circle.fill")
                            Text("キャンセル")
                        }.foregroundColor(.red)
                    }
                }
            }.navigationBarTitle("タスクの追加")
        }
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NewTask()
    }
}
