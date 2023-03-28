//
//  Binding+Extension.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/29.
//

import SwiftUI

extension Binding {
    
    init<T>(isNotNil source: Binding<T?>, defaultValue: T) where Value == Bool {
        self.init(get: { source.wrappedValue != nil },
                  set: { source.wrappedValue = $0 ? defaultValue : nil })
    }
    
    init(_ source: Binding<Value?>, _ defaultValue: Value) {
        
        self.init(get:{
            if source.wrappedValue == nil {
                source.wrappedValue = defaultValue
            }
            return source.wrappedValue ?? defaultValue
            
        },set:{
            source.wrappedValue = $0
        })
    }

}
