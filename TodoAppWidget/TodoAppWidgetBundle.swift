//
//  TodoAppWidgetBundle.swift
//  TodoAppWidget
//
//  Created by Kazuki Omori on 2023/04/02.
//

import WidgetKit
import SwiftUI

@main
struct TodoAppWidgetBundle: WidgetBundle {
    var body: some Widget {
        TodoAppWidget()
        TodoAppWidgetLiveActivity()
    }
}
