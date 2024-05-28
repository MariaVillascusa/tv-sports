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
                    Text(event.formatName(name: event.homeTeam))
                        .font(.headline)
                    Text(event.formatName(name: event.awayTeam))
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

#Preview (traits: .fixedLayout(width: 400, height: 100)) {
    EventRowView(event: Event(id:123456,homeTeam: "Janik Sinner", awayTeam: "Mevderev", status: "Directo", tournament: "Roland Garros", homeScore: Score(current: 5,period1: 2, period2: 4, period3: 6), awayScore: Score(current: 5, period1: 2, period2: 4, period3: 6),channels: ["M. Deportes 1", "Movistar Plus"]))
}
