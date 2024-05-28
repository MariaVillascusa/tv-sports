//
//  ApiService.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    private let jsonEvents = """
    [
        {
            "id": 2345678,
            "homeTeam": "Carlos Alcaraz",
            "awayTeam": "Novak Djokovic",
            "status": "Scheduled",
            "tournament": "French Open",
            "homeScore": {
                "current": 0
            },
            "awayScore": {
                "current": 0
            },
            "channels": ["ESPN", "Eurosport"]
        },
        {
            "id": 2345679,
            "homeTeam": "Roger Federer",
            "awayTeam": "Andy Murray",
            "status": "In Progress",
            "tournament": "Wimbledon",
            "homeScore": {
                "current": 1
            },
            "awayScore": {
                "current": 2
            },
            "channels": ["BBC Sport", "Tennis Channel"]
        },
        {
            "id": 2345680,
            "homeTeam": "Serena Williams",
            "awayTeam": "Simona Halep",
            "status": "Completed",
            "tournament": "US Open",
            "homeScore": {
                "current": 3
            },
            "awayScore": {
                "current": 1
            },
            "channels": ["ESPN", "ABC"]
        },
        {
            "id": 2345681,
            "homeTeam": "Naomi Osaka",
            "awayTeam": "Ashleigh Barty",
            "status": "Scheduled",
            "tournament": "Australian Open",
            "homeScore": {
                "current": 0
            },
            "awayScore": {
                "current": 0
            },
            "channels": ["Channel 7", "Eurosport"]
        },
        {
            "id": 2345682,
            "homeTeam": "Daniil Medvedev",
            "awayTeam": "Alexander Zverev",
            "status": "In Progress",
            "tournament": "French Open",
            "homeScore": {
                "current": 2
            },
            "awayScore": {
                "current": 2
            },
            "channels": ["ESPN", "Tennis Channel"]
        },
        {
            "id": 2345683,
            "homeTeam": "Petra Kvitová",
            "awayTeam": "Garbiñe Muguruza",
            "status": "Completed",
            "tournament": "Wimbledon",
            "homeScore": {
                "current": 3
            },
            "awayScore": {
                "current": 0
            },
            "channels": ["BBC Sport", "Eurosport"]
        },
        {
            "id": 2345684,
            "homeTeam": "Stefanos Tsitsipas",
            "awayTeam": "Dominic Thiem",
            "status": "Scheduled",
            "tournament": "US Open",
            "homeScore": {
                "current": 0
            },
            "awayScore": {
                "current": 0
            },
            "channels": ["ESPN", "ABC"]
        },
        {
            "id": 2345685,
            "homeTeam": "Iga Świątek",
            "awayTeam": "Coco Gauff",
            "status": "Completed",
            "tournament": "Australian Open",
            "homeScore": {
                "current": 2
            },
            "awayScore": {
                "current": 3
            },
            "channels": ["Channel 7", "Eurosport"]
        }
    ]

""".data(using: .utf8)!
    
    private init() {}
    
    func fetchEvents(completion: @escaping ([Event]) -> Void) {
//        let urlString = "https://api.example.com/events"
//        guard let url = URL(string: urlString) else {
//            print("URL inválida")
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error en la solicitud: \(error.localizedDescription)")
//                return
//            }
//            
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                print("Respuesta inválida del servidor")
//                return
//            }
//            
//            guard let data = data else {
//                print("Datos no recibidos")
//                return
//            }
//            
//            let jsonData = """
//            [
//                {
//                    "homeTeam": "Team A",
//                    "awayTeam": "Team B",
//                    "status": "Scheduled",
//                    "tournament": "Champions League",
//                    "homeScore": 0,
//                    "awayScore": 0,
//                    "channels": ["Channel 1", "Channel 2"]
//                }
//            ]
//            """.data(using: .utf8)!
//            
//            do {
//                let events = try JSONDecoder().decode([Event].self, from: jsonData)
//                completion(events)
//            } catch {
//                print("Error al decodificar JSON: \(error.localizedDescription)")
//            }
//        }.resume()
        
        do {
            let events = try JSONDecoder().decode([Event].self, from: jsonEvents)
            completion(events)
        } catch {
            print("Error al decodificar JSON: \(error)")
        } 
    }
}

