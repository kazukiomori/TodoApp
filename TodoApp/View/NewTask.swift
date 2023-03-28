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
            VStack {
                TextField("タスクを入力", text: $task)
                DatePicker(selection: $time, label: {Text("日時")})
                    .datePickerStyle(.wheel)
                Button(action: {}) {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                        Text("キャンセル")
                    }.foregroundColor(.red)

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
