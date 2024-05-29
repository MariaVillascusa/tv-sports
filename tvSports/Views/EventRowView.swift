//
//  EventRowView.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import SwiftUI

struct EventRowView: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Torneo: \(event.tournament)")
                .font(.caption)
                .padding(.bottom, 5)
            HStack {
                VStack(alignment: .leading){
                    Text(event.formatName(name: event.homeTeam.name))
                        .font(.headline)
                    Text(event.formatName(name: event.awayTeam.name))
                        .font(.headline)
                }
                if event.homeScore != nil && event.homeScore?.period1 != nil {
                    VStack{
                        Text(String(event.homeScore!.period1!))
                        Text(String(event.awayScore!.period1!))
                    }
                }
                if event.homeScore != nil && event.homeScore?.period2 != nil{
                    VStack{
                        Text(String(event.homeScore!.period2!))
                        Text(String(event.awayScore!.period2!))
                    }
                }
                if event.homeScore != nil && event.homeScore?.period3 != nil{
                    VStack{
                        Text(String(event.homeScore!.period3!))
                        Text(String(event.awayScore!.period3!))
                    }
                }
                
                VStack{
                    Text((event.homeScore != nil && event.homeScore!.current! != 0) ? String(event.homeScore!.current!): "-")
                    Text((event.awayScore != nil && event.awayScore!.current! != 0) ? String(event.awayScore!.current!): "-")
                }.padding(.leading,5).foregroundColor(.indigo)
                Spacer()
                
                if event.channels != nil {
                    VStack(alignment: .trailing){
                        ForEach(event.channels!, id: \.self) { string in
                            Text(string)
                                .font(.subheadline)
                                .fontWeight(.heavy)
                        }
                    }
                }
            }
            
        }
        .padding()
    }
}

//#Preview (traits: .fixedLayout(width: 400, height: 100)) {
//    EventRowView(event: Event(id:123456,homeTeam: Team(name: "Jannik Sinner", slug: "j-sinner", shortName: "Sinner", gender: "man", userCount: 123, playerTeamInfo: PlayerInfo(residence: <#T##String#>, birthplace: <#T##String#>, height: <#T##Int#>, weight: <#T##Int#>, plays: <#T##String#>, turnedPro: <#T##String#>, prizeCurrent: <#T##Int#>, prizeTotal: <#T##Int#>, id: <#T##Int#>, birthDateTimestamp: <#T##Int#>, prizeCurrentRaw: <#T##Prize#>, prizeTotalRaw: <#T##Prize#>, currentRanking: <#T##Int#>), nameCode: "sinner", ranking: 2, national: false, type: 1, id: 222, country: <#T##Country#>, fullName: "JanikSinner", teamColors: <#T##TeamColors#>), awayTeam: "Mevderev", status: "Directo", tournament: "Roland Garros", homeScore: Score(current: 5,period1: 2, period2: 4, period3: 6), awayScore: Score(current: 5, period1: 2, period2: 4, period3: 6),channels: ["M. Deportes 1", "Movistar Plus"]))}
