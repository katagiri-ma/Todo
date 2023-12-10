//
//  HomeView.swift
//  Todo
//
//  Created by user on 2023/12/10.
//

import SwiftUI

struct HomeView: View {
    var body: some View {

      NavigationStack{
        VStack {
//          UserView(image: Image("profile"), userName:"maya")
          VStack{
            HStack{
              CategoryView(category: .ImpTeam_1st)
              NavigationLink{
                ContentView()
                
//                Tasks(category: .ImpPersonal_2nd)
              }label: {
                CategoryView(category: .ImpPersonal_2nd)
              }
            }
            HStack{
              CategoryView(category: .NImpMtg_3rd)
              CategoryView(category: .NImpHelp_4th)

            }
          }
        }
        .background(Color.tBackground)
        //        .edgesIgnoringSafeArea(.bottom)
        //        .padding()
      }
    }
  }


#Preview {
    HomeView()
}
