//
//  ContentView.swift
//  Todo
//
//  Created by user on 2023/12/08.
//

import SwiftUI
import CoreData

struct ContentView: View {

  @Environment(\.managedObjectContext) var viewContext
  @FetchRequest(sortDescriptors: [])
  var tasks: FetchedResults<Tasks>

//  textFieldを作れる様にする
  @State var task = ""

  var body: some View {
    List{
      ForEach(tasks){ task in
        if((task.task?.isEmpty) == false) {
          HStack{
            if(task.checked) {
              Text("☑️")
            }
            else{
              Text("◻︎")
            }
            Button(action: {
              task.checked.toggle()
            })
            {
              Text(task.task!)
            }
          }

        }
      }
      TextField("タスクを入力してください", text: $task)
        .onSubmit {
          addTask()
        }

      Button(action: deleteTask){
        Text("Delete")
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
