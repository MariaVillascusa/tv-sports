//
//  Event.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import Foundation

class Event: Codable, Identifiable {
    var id: Int
    var homeTeam: Team
    var awayTeam: Team
    var status: Status
    var tournament: String
    var homeScore: Score?
    var awayScore: Score?
    var channels: [String]?
    
    init(id: Int, homeTeam: Team, awayTeam: Team, status: Status, tournament: String, homeScore: Score? = nil, awayScore: Score? = nil) {
        self.id = id
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.status = status
        self.tournament = tournament
        self.homeScore = homeScore
        self.awayScore = awayScore
    }
    
    
    func formatName(name:String) -> String{
        let separatedName = name.split(separator: " ")
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
    private var period4: Int?
    private var period5: Int?
    private var period1TieBreak: Int?
    private var period2TieBreak: Int?
    private var period3TieBreak: Int?
    private var period4TieBreak: Int?
    private var period5TieBreak: Int?
    private var point: String?;
    
    init(current: Int? = nil, period1: Int? = nil, period2: Int? = nil, period3: Int? = nil, period4: Int? = nil, period5: Int? = nil, period1TieBreak: Int? = nil, period2TieBreak: Int? = nil, period3TieBreak: Int? = nil, period4TieBreak: Int? = nil, period5TieBreak: Int? = nil, point: String? = nil) {
        self.current = current
        self.period1 = period1
        self.period2 = period2
        self.period3 = period3
        self.period4 = period4
        self.period5 = period5
        self.period1TieBreak = period1TieBreak
        self.period2TieBreak = period2TieBreak
        self.period3TieBreak = period3TieBreak
        self.period4TieBreak = period4TieBreak
        self.period5TieBreak = period5TieBreak
        self.point = point
    }
}

class Status: Codable {
 private var code: Int;
 private var description: String;
 private var type: String;
    init(code: Int, description: String, type: String) {
        self.code = code
        self.description = description
        self.type = type
    }
}
