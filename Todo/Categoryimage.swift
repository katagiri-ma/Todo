//
//  Categoryimage.swift
//  Todo
//
//  Created by user on 2023/12/09.
//

import SwiftUI

struct Categoryimage: View {
    var body: some View {
      NavigationStack{
        VStack{


          NavigationLink{
            ContentView()
          } label: {
            Image(systemName: "person.fill")
              .resizable()
              .scaledToFit()
              .foregroundColor(.white)
              .padding(6.0)
              .frame(width: 30, height: 30)
            //      Color("")まで入れると色が選択できる
              .background(Color(hue: 0.28, saturation: 0.488, brightness: 0.745))
              .cornerRadius(6.0)
//            Text("contentviewへ遷移")
          }
        }

      }
//          .background(Color.blue)
    }
}

#Preview {
    Categoryimage()
}






