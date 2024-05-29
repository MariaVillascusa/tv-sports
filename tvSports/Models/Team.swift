//
//  Team.swift
//  tvSports
//
//  Created by Maria  Villascusa on 30/5/24.
//


import Foundation

class Team: Codable {
    var name: String;
    var slug: String;
    var shortName: String;
    var gender: String;
    var userCount: Int;
    var playerTeamInfo: PlayerInfo;
    var nameCode: String;
    var ranking: Int;
    var national: Bool;
    var type: Int;
    var id: Int;
    var country: Country;
    var fullName: String;
    var teamColors: TeamColors;
    
    init(name: String, slug: String, shortName: String, gender: String, userCount: Int, playerTeamInfo: PlayerInfo, nameCode: String, ranking: Int, national: Bool, type: Int, id: Int, country: Country, fullName: String, teamColors: TeamColors) {
        self.name = name
        self.slug = slug
        self.shortName = shortName
        self.gender = gender
        self.userCount = userCount
        self.playerTeamInfo = playerTeamInfo
        self.nameCode = nameCode
        self.ranking = ranking
        self.national = national
        self.type = type
        self.id = id
        self.country = country
        self.fullName = fullName
        self.teamColors = teamColors
    }
}

class PlayerInfo: Codable {
    var residence: String;
    var birthplace: String;
    var height: Int;
    var weight: Int;
    var plays: String;
    var turnedPro: String;
    var prizeCurrent: Int;
    var prizeTotal: Int;
    var id: Int;
    var birthDateTimestamp: Int;
    var prizeCurrentRaw: Prize;
    var prizeTotalRaw: Prize;
    var currentRanking: Int;
    
    init(residence: String, birthplace: String, height: Int, weight: Int, plays: String, turnedPro: String, prizeCurrent: Int, prizeTotal: Int, id: Int, birthDateTimestamp: Int, prizeCurrentRaw: Prize, prizeTotalRaw: Prize, currentRanking: Int) {
        self.residence = residence
        self.birthplace = birthplace
        self.height = height
        self.weight = weight
        self.plays = plays
        self.turnedPro = turnedPro
        self.prizeCurrent = prizeCurrent
        self.prizeTotal = prizeTotal
        self.id = id
        self.birthDateTimestamp = birthDateTimestamp
        self.prizeCurrentRaw = prizeCurrentRaw
        self.prizeTotalRaw = prizeTotalRaw
        self.currentRanking = currentRanking
    }
}

class TeamColors: Codable {
    var primary: String;
    var secondary: String;
    var text: String;
    
    init(primary: String, secondary: String, text: String) {
        self.primary = primary
        self.secondary = secondary
        self.text = text
    }
}

class Prize: Codable {
    var value: Int;
    var currency: String;
    init(value: Int, currency: String) {
        self.value = value
        self.currency = currency
    }
}

