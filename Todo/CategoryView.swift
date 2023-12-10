//
//  CategoryView.swift
//  Todo
//
//  Created by user on 2023/12/10.
//

import SwiftUI

struct CategoryView: View {

  var category: Tasks.Category
  @State var numberOfTasks = 0
  @State var showList = false
  @Environment(\.managedObjectContext) var viewContext
  var body: some View {
    VStack(alignment: .leading){
      Image(systemName: category.image())
        .font(.largeTitle)

          Text(category.toString())
//          Text("\(numberOfTasks)タスク")
          Button(action: {}) {
            Image(systemName: "plus")
          }
      //    //      上寄せ
          Spacer()
      //
        }
          .padding()
          .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,minHeight: 150)
          .foregroundColor(.white)
          .background(category.color())
          .cornerRadius(20)
//    }
  }
}

#Preview {
  VStack{
    CategoryView(category: .ImpTeam_1st,numberOfTasks: 100)
    CategoryView(category: .ImpPersonal_2nd,numberOfTasks: 100)
    CategoryView(category: .NImpMtg_3rd ,numberOfTasks: 100)
    CategoryView(category: .NImpHelp_4th,numberOfTasks: 100)
  }

}
