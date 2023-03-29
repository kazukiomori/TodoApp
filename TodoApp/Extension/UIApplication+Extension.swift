//
//  UIApplication+Extension.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/29.
//

import SwiftUI

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}
