//
//  CheckBox.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

struct CheckBox: View {
    @State var checked: Bool = false
    var body: some View {
        Toggle(isOn: $checked) {
            Text("チェックボックス")
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox()
    }
}
