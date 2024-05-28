//
//  EventView.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import SwiftUI

struct EventView: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Event: \(event.tournament)")
                .font(.caption)
                .padding(.bottom, 5)
            HStack {
                VStack(alignment: .leading){
                    Text(event.homeTeam)
                        .font(.headline)
                        
                    
                    Text(event.awayTeam)
                        .font(.headline)
                        
                }
                VStack{
                    Text(String(event.homeScore.period1))
                    Text(String(event.awayScore.period1))
                }
                VStack{
                    Text(String(event.homeScore.period2))
                    Text(String(event.awayScore.period2))
                }
                VStack{
                    Text(String(event.homeScore.period3))
                    Text(String(event.awayScore.period3))
                }
                VStack{
                    Text(String(event.homeScore.current))
                    Text(String(event.awayScore.current))
                }.padding(.leading,5).foregroundColor(.indigo)
                Spacer()

                VStack(alignment: .trailing){
                    ForEach(event.channels, id: \.self) { string in
                        Text(string)
                            .font(.subheadline)
                            .fontWeight(.heavy)
                    }
                }
            }
            
        }
        .padding()
    }
}

#Preview (traits: .fixedLayout(width: 400, height: 400)) {
    EventView(event: Event(homeTeam: "Sinner", awayTeam: "Mevderev", status: "Directo", tournament: "Roland Garros", homeScore: Score(current: 5, period1: 6, period2: 6, period3: 3), awayScore: Score(current: 5, period1: 2, period2: 4, period3: 6),channels: ["M. Deportes 1", "Movistar Plus"]))
}
