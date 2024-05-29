//
//  ApiService.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchEvents(completion: @escaping ([Event]) -> Void) {
        let urlString = "https://allsportsapi2.p.rapidapi.com/api/tennis/events/28/5/2024"
        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }
        print(Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String as Any)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("allsportsapi2.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Respuesta inválida del servidor")
                return
            }
            
            guard let data = data else {
                print("Datos no recibidos")
                return
            }
            print(data)
            do {
                let events = try JSONDecoder().decode([Event].self, from: data)
                print(events)
                print(events[0])
            } catch {
                print("Error al decodificar JSON: \(error.self)")
            }
        }.resume()
    }
    
    func fetchFromJson(){
        let jsonEvents = """
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
        do {
            let events = try JSONDecoder().decode([Event].self, from: jsonEvents)
            print(events)
        } catch {
            print("Error al decodificar JSON: \(error)")
        }
    }
    
}


