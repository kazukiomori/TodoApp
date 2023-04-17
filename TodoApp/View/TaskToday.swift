//
//  TaskToday.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/29.
//

import SwiftUI

struct TaskToday: View {
    // MARK: Property
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.time,
                                           ascending: true)],
        predicate: NSPredicate(format:"time BETWEEN {%@ , %@}", Date.today as NSDate, Date.tomorrow as NSDate),
        animation: .default)
     var todoList: FetchedResults<TodoEntity>
    
    // MARK: Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("today_task").font(.footnote).bold().padding()
            List(todoList) { todo in
                TodoDetailRow(todo: todo)
            }
        }.background(Color(UIColor.systemBackground))
        .clipShape(RoundedCorners(tl: 40, tr: 40, bl: 0, br: 0))
    }
}

// MARK: Preview
struct TaskToday_Previews: PreviewProvider {
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    static var previews: some View {
        TaskToday()
            .environment(\.managedObjectContext, context)
    }
}
