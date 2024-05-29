//
//  ApiChannelService.swift
//  tvSports
//
//  Created by Maria  Villascusa on 30/5/24.
//

import Foundation

class APIChannelService {
    static let shared = APIChannelService()
    
    private init() {}
    
    func fetchChannel(completion: @escaping (Channel) -> Void) {
        let urlString = "https://allsportsapi2.p.rapidapi.com/api/tv/channel/2027/event/12361919"
        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }
        
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
            
            do {
                let channelResponse = try JSONDecoder().decode(ChannelResponse.self, from: data)
                let channel = Channel(id: channelResponse.tvChannelVotes.tvChannel.id, name: channelResponse.tvChannelVotes.tvChannel.name, upvote: channelResponse.tvChannelVotes.upvote, downvote: channelResponse.tvChannelVotes.downvote)
                
                print(channel.id)
                print(channel.name)
                print(channel.upvote)
                print(channel.downvote)
            } catch {
                print("Error al decodificar JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
