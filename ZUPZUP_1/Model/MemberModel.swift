//
//  MemberModel.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 2/19/25.
//
import Foundation

struct Member: Codable, Identifiable {
    let id: Int
    let nickname: String
    let email: String
    let coin: Int
    let phase: String

    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case nickname
        case email
        case coin
        case phase
    }
}
