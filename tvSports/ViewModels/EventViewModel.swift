//
//  EventViewModel.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import Foundation

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    func fetchEvents() {
        APIService.shared.fetchEvents { [weak self] events in
            DispatchQueue.main.async {
                self?.events = events
            }
        }
    }
}

