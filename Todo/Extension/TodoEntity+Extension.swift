
//  TodoEntity+Extension.swift
//  Todo
//
//  Created by user on 2023/12/10.

import CoreData
import SwiftUI



extension Tasks {

//テストデータ　seed的な
//  NSManagedObjectContext　データベース操作用のインスタンス
//  今回はTodoEntityの作成用に使う
  static func create(in managedObjectContext: NSManagedObjectContext,
                     category: Category,
                     task: String,
                     time: Date? = Date()){
//    ここでTodoEntityデータを作成
      let todo = self.init(context: managedObjectContext)
      print(task)
//      todo.time = time
      todo.category = category.rawValue
      todo.task = task
//      todo.state = State.todo.rawValue
      todo.id = UUID().uuidString

      do {
          try  managedObjectContext.save()
      } catch {
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
  }



//  列挙型（enum）とは関連性のある事柄、データを一つにまとめた定数のようなもの
    enum Category: Int16 {
        case ImpTeam_1st     // Important & Urgent (第Ⅰ領域）//Team &
        case ImpPersonal_2nd    // Important & Not Urgent (第Ⅱ領域）//Personal & Not Urgent
        case NImpMtg_3rd    // Not Important & Urgent（第Ⅲ領域）//Mtg
        case NImpHelp_4th   // Not Important & Not Urgent（第Ⅳ領域）//Help

        func toString() -> String {
            switch self {
            case .ImpTeam_1st:
//                return "重要かつ緊急"
                return "チームのタスク"
            case .ImpPersonal_2nd:
//                return "重要だが緊急ではない"
                return "自分のタスク"
            case .NImpMtg_3rd :
//                return "重要でないが緊急"
                return "mtgタスク"
            case .NImpHelp_4th :
//                return "重要でも緊急でもない"
                return "ヘルプタスク"
            }
        }
        func image() -> String {
            switch self {
            case .ImpTeam_1st:
                return "person.3.fill"
            case .ImpPersonal_2nd:
                return "person.fill"
            case .NImpMtg_3rd:
                return "alarm"
            case .NImpHelp_4th :
                return "figure.wrestling"
            }
        }
        func color() -> Color {
            switch self {
            case .ImpTeam_1st:
                return .tRed
            case .ImpPersonal_2nd:
                return .tBlue
            case .NImpMtg_3rd:
                return .tGreen
            case .NImpHelp_4th:
                return .tYellow
            }
        }
    }

//  タスクが完了か未完了か
    enum State: Int16 {
        case todo
        case done
    }
}
