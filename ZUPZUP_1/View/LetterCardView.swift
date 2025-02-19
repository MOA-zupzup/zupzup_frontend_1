//
//  LetterCardView.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 2/18/25.
//

import SwiftUI

enum SwipeDirection {
  case left, right, none
}

struct LetterCardView: View {
  @State private var cards = ["LetterCard1", "LetterCard2", "LetterCard3"]
  @State private var removedCards: [String] = [] // 제거된 카드를 저장하는 배열
  @State private var dragOffset: CGSize = .zero
  @State private var swipeDirection: SwipeDirection = .none
  
  private let swipeThreshold: CGFloat = 150
  
  var body: some View {
    ZStack {
      ForEach(cards.indices, id: \.self) { index in
        cardView(for: index)
          .id(cards[index])
          .stacked(
            at: index,
            in: cards.count,
            swipeProgress: (index != cards.count - 1) ? min(1, abs(dragOffset.width) / swipeThreshold) : 0,
            swipeDirection: swipeDirection
          )
          .transition(.asymmetric(
            insertion: swipeDirection == .right ? .move(edge: .leading) : .move(edge: .trailing),
            removal: swipeDirection == .right ? .move(edge: .trailing) : .move(edge: .leading)
          ))
      }
    }
    // 전체 애니메이션에도 자연스러운 스프링 효과 적용
    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.5), value: cards)
    .padding()
  }
  
  @ViewBuilder
  private func cardView(for index: Int) -> some View {
    ZStack {
      Image(cards[index])
        .resizable()
        .frame(width: 260, height: 160)
    }
    // 최상단 카드, 왼쪽 스와이프 시에만 드래그 효과 적용
    .offset((index == cards.count - 1 && dragOffset.width < 0) ? dragOffset : .zero)
    .rotationEffect(
        .degrees(index == cards.count - 1 && dragOffset.width > 0 ?
                  min(Double(dragOffset.width / swipeThreshold) * 10, 10) : 0),
        anchor: .center
    )


    .gesture(
      (index == cards.count - 1) ?
      DragGesture()
        .onChanged { value in
          dragOffset = CGSize(width: value.translation.width, height: 0)
        }
        .onEnded { value in
          if abs(value.translation.width) > swipeThreshold {
            if value.translation.width < 0 {
              // 왼쪽 스와이프: 카드 제거
              swipeDirection = .left
              if cards.count > 1 {
                withAnimation(.interpolatingSpring(stiffness: 250, damping: 30)) {
                  dragOffset = CGSize(width: -1000, height: 0)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                  withAnimation(.interpolatingSpring(stiffness: 250, damping: 30)) {
                    let removed = cards.removeLast()
                    removedCards.append(removed)
                    dragOffset = .zero
                    swipeDirection = .none
                  }
                }
              } else {
                withAnimation(.interpolatingSpring(stiffness: 250, damping: 30)) {
                  dragOffset = .zero
                }
              }
            } else {
              // 오른쪽 스와이프: 이전에 넘겼던 카드 복원
              if !removedCards.isEmpty {
                swipeDirection = .right
                withAnimation(.interpolatingSpring(stiffness: 250, damping: 30)) {
                  dragOffset = CGSize(width: swipeThreshold, height: 50)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                  withAnimation(.interpolatingSpring(stiffness: 300, damping: 20)) {
                    // 현재 맨 위 카드를 스택의 맨 아래로 이동
//                    let current = cards.removeLast()
//                    cards.insert(current, at: 0)
                    // 이전에 넘겼던 카드(removedCards의 마지막)를 복원하여 맨 위에 추가
                    let restored = removedCards.removeLast()
                    cards.append(restored)
                    dragOffset = .zero
                    swipeDirection = .none
                  }
                }
              } else {
                withAnimation(.interpolatingSpring(stiffness: 250, damping: 30)) {
                  dragOffset = .zero
                }
              }
            }
          } else {
            withAnimation(.interpolatingSpring(stiffness: 250, damping: 30)) {
              dragOffset = .zero
            }
          }
        }
      : nil
    )
  }
}

extension View {
  func stacked(at index: Int, in total: Int, swipeProgress: CGFloat = 0, swipeDirection: SwipeDirection = .none) -> some View {
    let baseOffset = CGFloat(total - index - 1) * 10
    let baseRotation = Double(total - index - 1) * -3.0
    let effectiveProgress = (swipeDirection == .right) ? swipeProgress * 0.3 : swipeProgress

    var dynamicOffset: CGFloat = 0
    var dynamicRotation: Double = 0

    if swipeDirection == .left && index == 0 && total >= 2 {
      let nextOffset = CGFloat(total - 2) * 10
      dynamicOffset = baseOffset - ((baseOffset - nextOffset) * effectiveProgress)
      let nextRotation = Double(total - 2) * -3.0
      dynamicRotation = baseRotation - ((baseRotation - nextRotation) * Double(effectiveProgress))
    } else {
      dynamicOffset = (index != total - 1) ? baseOffset * (1 - effectiveProgress) : 0
      dynamicRotation = (index != total - 1) ? baseRotation * (1 - Double(effectiveProgress)) : 0
    }
    
    return self
      .offset(y: dynamicOffset)
      .rotationEffect(.degrees(dynamicRotation))
  }
}

struct LetterCardView_Previews: PreviewProvider {
  static var previews: some View {
    LetterCardView()
  }
}
