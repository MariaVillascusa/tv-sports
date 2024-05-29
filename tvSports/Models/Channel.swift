//
//  Channel.swift
//  tvSports
//
//  Created by Maria  Villascusa on 30/5/24.
//

import Foundation

class Channel: Codable, Identifiable {
    var id: Int
    var name: String
    var upvote: Int
    var downvote: Int

    init(id: Int, name: String, upvote: Int, downvote: Int) {
        self.id = id
        self.name = name
        self.upvote = upvote
        self.downvote = downvote
    }
}

