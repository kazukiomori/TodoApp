//
//  NewTask.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/29.
//

import SwiftUI

struct NewTask: View {
    @State var task: String = ""
    @State var time: Date = Date()
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("タスク")) {
                    TextField("タスクを入力", text: $task)
                }
                Section(header: Toggle(isOn: .constant(true)) {Text("時間を指定する")}) {
                    DatePicker(selection: $time, label: {Text("日時")})
                        .datePickerStyle(.wheel)
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
