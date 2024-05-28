//
//  ListView.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            EventView(event: Event(homeTeam: "Alcaraz", awayTeam: "Zverev", status: "Directo", tournament: "Roland Garros", homeScore: Score(current: 5, period1: 6, period2: 6, period3: 3), awayScore: Score(current: 5, period1: 2, period2: 4, period3: 6),channels: ["Eurosport 1", "Vamos"]))
            EventView(event: Event(homeTeam: "Sinner", awayTeam: "Mevderev", status: "Directo", tournament: "Roland Garros", homeScore: Score(current: 5, period1: 6, period2: 6, period3: 3), awayScore: Score(current: 5, period1: 2, period2: 4, period3: 6),channels: ["M. Deportes 1", "Movistar Plus"]))
            EventView(event: Event(homeTeam: "Federer", awayTeam: "Djokovic", status: "Directo", tournament: "Roland Garros", homeScore: Score(current: 5, period1: 6, period2: 6, period3: 3), awayScore: Score(current: 5, period1: 2, period2: 4, period3: 6),channels: ["Eurosport 2", "M. Deportes 2"]))
        }
    }
}

#Preview {
    ListView()
}
