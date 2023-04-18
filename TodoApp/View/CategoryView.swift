//
//  CategoryView.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

struct CategoryView: View {
    // MARK: Property
    var category: TodoEntity.Category
    @State var numberOfTasks = 0
    @State var showList = false
    @Environment(\.managedObjectContext) var viewContext
    @State var addNewTask = false
    
    // MARK: Function
    fileprivate func update() {
        self.numberOfTasks = TodoEntity.count(in: self.viewContext, category: self.category)
    }
    // MARK: Body
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(systemName: category.image())
                .font(.largeTitle)
                .sheet(isPresented: $showList, onDismiss: self.update) {
                    ToDoList(category: self.category, showList: $showList)
                        .environment(\.managedObjectContext, self.viewContext)
                }
            Text(category.toString())
                .foregroundColor(.black)
                .bold()
            Text("\(numberOfTasks)taskConut")
            Button(action: {
                self.addNewTask = true
            }) {
                HStack {
                    Image(systemName: "plus")
                    Text("addTask")
                }
            }.sheet(isPresented: $addNewTask, onDismiss: self.update) {
                NewTask(category: self.category.rawValue)
                    .environment(\.managedObjectContext, viewContext)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 150)
        .foregroundColor(.white)
        .background(category.color())
        .cornerRadius(20)
        .onTapGesture {
            self.showList = true
        }
        .onAppear {
            self.update()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    static var previews: some View {
        VStack {
            CategoryView(category: .ImpUrg_1st,
                         numberOfTasks: 100)
            CategoryView(category: .ImpNUrg_2nd,
                         numberOfTasks: 100)
            CategoryView(category: .NImpUrg_3rd,
                         numberOfTasks: 100)
            CategoryView(category: .NImpNUrg_4th,
                         numberOfTasks: 100)
        }.environment(\.managedObjectContext, container.viewContext)
    }
}
