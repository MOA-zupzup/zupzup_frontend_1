//
//  PaperModel.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 2/19/25.
//

import Foundation

struct Paper: Codable, Identifiable {
    let id: Int
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case id = "paper_id"
        case imageUrl = "paper_url"
    }
}
