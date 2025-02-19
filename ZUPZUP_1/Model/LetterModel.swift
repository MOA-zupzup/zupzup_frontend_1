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
        case location = "locate"
        case createdAt
        case status
        case pictureUrl = "picture_url"
        case paperUrl = "paper_url"
        case mailbox = "Mailbox"
    }
}
