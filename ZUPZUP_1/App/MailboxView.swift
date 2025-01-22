//
//  MailboxView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/3/25.
//

import SwiftUI

struct MailboxView: View {
  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(1...1000, id: \.self) { index in
          Text("아이템 \(index)")
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)
        }
      }
    }
  }
}

#Preview {
  MailboxView()
}
