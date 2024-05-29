//
//  ChannelViewModel.swift
//  tvSports
//
//  Created by Maria  Villascusa on 30/5/24.
//

import Foundation

class ChannelViewModel: ObservableObject {
    @Published var channel: Channel?
    
    func fetchChannel() {
        APIChannelService.shared.fetchChannel { [weak self] channel in
            DispatchQueue.main.async {
                self?.channel = channel
            }
        }
    }
}
