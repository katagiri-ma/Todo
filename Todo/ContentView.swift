//
//  ContentView.swift
//  Todo
//
//  Created by user on 2023/12/08.
//

import SwiftUI
import CoreData

struct ContentView: View {

//  @Environment(\.managedObjectContext) private var viewContext
  @Environment(\.managedObjectContext) var viewContext
  @FetchRequest(sortDescriptors: [])
//  var tasks: FetchedResults<Tasks>
  var tasks: FetchedResults<Tasks>


//  textFieldを作れる様にする
//  @Stateを作ると、変数の変更を自動的に画面に反映
  @State var task = ""

  var body: some View {
//    NavigationView{
    NavigationStack{
      List{
//        ForEach(tasks){ task in
        ForEach(tasks, id: \.self) { task in
          HStack{
            Image(systemName:task.checked ? "checkmark.circle" : "circle")
            Button(action: {
              task.checked.toggle()
            })
            {
              if task.checked == true{
                Text(task.task!).strikethrough()
                  .fontWeight(.ultraLight)
              }else{
                Text(task.task!)
              }
            }
          }
        }
        TextField("タスクを入力してください", text: $task)
          .onSubmit {
            addTask()
          }

//        Button(action: deleteTask){
//          Text("Delete")
//        }

        .navigationTitle(Text("Tasks"))
        .navigationBarItems(trailing: Button(action: {deleteTask()})
        {
          Text("Delete")
        })
      }
    }
  }
  func addTask() {
    let newTask = Tasks(context: viewContext)
    newTask.task = task

    do {
      try viewContext.save()
    }catch{
      fatalError("セーブに失敗")
    }
//実行後の値のリセット
    task = ""
  }

  func deleteTask(){
    for task in tasks {
      if(task.checked){
        viewContext.delete(task)
      }
    }

    do {
      try viewContext.save()
    }catch{
      fatalError("セーブに失敗")
    }
  }

}

#Preview {
  
  ContentView()

}
