import UIKit
import Foundation

let headers = [
    "X-RapidAPI-Key": "106d6c7337msh3c6a4cf0d1e0002p11d5e1jsn0734040d1d7b",
    "X-RapidAPI-Host": "allsportsapi2.p.rapidapi.com"
]
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://allsportsapi2.p.rapidapi.com/api/tennis/events/28/5/2024")! as URL,
//                                        cachePolicy: .useProtocolCachePolicy,
//                                    timeoutInterval: 10.0)
//request.httpMethod = "GET"
//request.allHTTPHeaderFields = headers
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//    if (error != nil) {
//        print(error as Any)
//    } else {
//        let httpResponse = response as? HTTPURLResponse
//        print(httpResponse ?? "nada")
//    }
//})
//
//dataTask.resume()

//func fetchEvents() {
//    let urlString = "https://allsportsapi2.p.rapidapi.com/api/tennis/events/28/5/2024"
//    guard let url = URL(string: urlString) else {
//        print("URL inválida")
//        return
//    }
//    
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//    request.setValue("106d6c7337msh3c6a4cf0d1e0002p11d5e1jsn0734040d1d7b", forHTTPHeaderField: "X-RapidAPI-Key")
//    request.setValue("allsportsapi2.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
//    
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Error en la solicitud: \(error.localizedDescription)")
//            return
//        }
//        
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            print("Respuesta inválida del servidor")
//            return
//        }
//        
//        guard let data = data else {
//            print("Datos no recibidos")
//            return
//        }
//        print(data)
//        do {
//            let events = try JSONDecoder().decode([Event].self, from: data)
//            print(events)
//            print(events[0])
//        } catch {
//            print("Error al decodificar JSON: \(error.self)")
//        }
//    }.resume()
//}
//fetchEvents()

func fetchChannel() {
    let urlString = "https://allsportsapi2.p.rapidapi.com/api/tv/channel/2027/event/12361919"
    guard let url = URL(string: urlString) else {
        print("URL inválida")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("106d6c7337msh3c6a4cf0d1e0002p11d5e1jsn0734040d1d7b", forHTTPHeaderField: "X-RapidAPI-Key")
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

class Channel: Codable, Identifiable {
    var id: Int
    var name: String
    var upvote: Int
    var downvote: Int
    
    init(id: Int, name: String, upvote: Int, downvote: Int) {
        self.id = id
        self.name = name
        self.upvote = upvote
        self.downvote = downvote
    }
}
// Estructura auxiliar para decodificar la respuesta JSON
struct ChannelResponse: Codable {
    let tvChannelVotes: TVChannelVotes
    
    struct TVChannelVotes: Codable {
        let tvChannel: TVChannel
        let upvote: Int
        let downvote: Int
    }
    
    struct TVChannel: Codable {
        let name: String
        let id: Int
    }
}

fetchChannel()
