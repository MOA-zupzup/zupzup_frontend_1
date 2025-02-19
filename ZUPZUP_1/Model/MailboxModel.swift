//
//  MailboxModel.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 2/19/25.
//

import Foundation

struct Mailbox: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "Mailbox"
    }
}
