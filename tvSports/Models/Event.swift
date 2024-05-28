//
//  Event.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import Foundation

class Event: Codable, Identifiable {
    var id: Int
    var homeTeam: String
    var awayTeam: String
    var status: String
    var tournament: String
    var homeScore: Score?
    var awayScore: Score?
    var channels: [String]
    
    init(id: Int, homeTeam: String, awayTeam: String, status: String, tournament: String, homeScore: Score? = nil, awayScore: Score? = nil, channels: [String]) {
        self.id = id
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.status = status
        self.tournament = tournament
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.channels = channels
    }
    
    func formatName(name:String) -> String{
        var separatedName = name.split(separator: " ")
        if separatedName.count == 1 {return name}
        let initial = separatedName[0].prefix(1)
        return "\(initial). \(separatedName[1])"
    }
}


class Score: Codable {
    var current: Int?
    var period1: Int?
    var period2: Int?
    var period3: Int?
    
    init(current: Int? = nil, period1: Int? = nil, period2: Int? = nil, period3: Int? = nil) {
        self.current = current
        self.period1 = period1
        self.period2 = period2
        self.period3 = period3
    }
}
