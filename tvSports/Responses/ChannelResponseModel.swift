//
//  ChannelResponseModel.swift
//  tvSports
//
//  Created by Maria  Villascusa on 30/5/24.
//

import Foundation

struct ChannelResponse: Codable {
    let tvChannelVotes: TVChannelVotes
    
    struct TVChannelVotes: Codable {
        let tvChannel: TVChannel
        let upvote: Int
        let downvote: Int
    }
    
    struct TVChannel: Codable {
        let name: String
        let id: Int
    }
}

struct CountryChannelsResponse: Codable {
    let countryChannels: [String: [Int]]
}
