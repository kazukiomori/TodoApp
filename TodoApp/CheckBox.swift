//
//  CheckBox.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

struct CheckBox<Label>: View where Label: View {
    // MARK: Property
    @Binding var checked: Bool
    private var label: () -> Label
    
    // MARK: initializer
    public init(checked: Binding<Bool>,
                @ViewBuilder label: @escaping () -> Label) {
        //バインディング構造体にアクセスするために"_"をつける
        self._checked = checked
        self.label = label
    }
    
    // MARK: Body
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.circle" : "circle")
                .onTapGesture {
                    self.checked.toggle()
            }
            label()
        }
    }
}

// MARK: Preview
struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CheckBox(checked: .constant(false)) {
                Text("牛乳を買う")
            }
            CheckBox(checked: .constant(true)) {
                
            }
        }
    }
}
