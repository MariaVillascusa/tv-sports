//
//  Event.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import Foundation

class Event {
    var homeTeam: String
    var awayTeam: String
    var status: String
    var tournament: String
    var homeScore: Score
    var awayScore: Score
    var channels: [String]
    
    init(homeTeam: String, awayTeam: String, status: String, tournament: String, homeScore: Score, awayScore: Score, channels: [String]) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.status = status
        self.tournament = tournament
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.channels = channels
    }
}


class Score {
    var current: Int
    var period1: Int
    var period2: Int
    var period3: Int
    init(current: Int, period1: Int, period2: Int, period3: Int) {
        self.current = current
        self.period1 = period1
        self.period2 = period2
        self.period3 = period3
    }
}
