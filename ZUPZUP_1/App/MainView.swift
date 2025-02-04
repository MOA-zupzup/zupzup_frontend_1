//
//  MainView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/3/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
      
      TabView {
        ContentView()
          .tabItem { Label ("지도", systemImage: "map")}
        MailboxView()
          .tabItem { Label ("우편함", systemImage: "envelope")}
        StoreView()
          .tabItem { Label ("상점", systemImage: "cart")}
        MypageView()
          .tabItem { Label ("마이페이지", systemImage: "person")}
      }
      .accentColor(.customGreen)
    }
}

#Preview {
    MainView()
}
