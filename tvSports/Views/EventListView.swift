//
//  EventListView.swift
//  tvSports
//
//  Created by Maria  Villascusa on 28/5/24.
//

import SwiftUI

struct EventListView: View {
    @ObservedObject var viewModel = EventViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.events) { event in
                EventRowView(event: event)
            }          

            .navigationTitle("Partidos del día")
            .onAppear {
                viewModel.fetchEvents()
            }
        }
    }
}

#Preview {
    EventListView()
}
