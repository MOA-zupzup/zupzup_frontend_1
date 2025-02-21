//
//  LetterModel.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 2/19/25.
//

import Foundation

struct Letter: Codable, Identifiable {
    let id: Int
    let senderId: Int
    let receiverId: Int?
    let paperId: Int
    let title: String
    let content: String
    let location: String
    let createdAt: String
    let status: String
    let pictureUrl: String?
    let paperUrl: String
    let mailbox: String

  enum CodingKeys: String, CodingKey {
      case id = "letter_id"
      case senderId = "sender_id"
      case receiverId = "receiver_id"
      case paperId = "paper_id"
      case title
      case content
      case location
      case createdAt
      case status
      case pictureUrl = "picture_url"
      case paperUrl = "paper_url"
      case mailbox = "mailbox"
  }

}

import Foundation

// ✅ JSON 파일을 불러와 `Letter` 배열로 변환하는 함수
func loadLetters() -> [Letter] {
    guard let url = Bundle.main.url(forResource: "Letter", withExtension: "json") else {
        print("❌ Letter.json 파일을 찾을 수 없음!")
        return []
    }

    do {
        print("✅ Letter.json 파일을 찾음: \(url.absoluteString)")  // ✅ 파일 경로 출력
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let letters = try decoder.decode([Letter].self, from: data)
        print("✅ JSON 로드 성공: \(letters.count)개의 편지")  // ✅ JSON 개수 출력
        return letters
    } catch {
        print("❌ JSON 디코딩 오류:", error)
        return []
    }
}
