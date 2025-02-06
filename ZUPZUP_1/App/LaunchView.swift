//
//  LauncView.swift
//  ZUPZUP_1
//
//  Created by 이주희 on 2/7/25.
//

import SwiftUI
struct LaunchView: View {
    var body: some View {
        VStack{
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 40)
            Text("일상에서 만나는 이야기, 줍줍")
                .foregroundStyle(.gray)
        }
    }
}

#Preview{
    LaunchView()
}

