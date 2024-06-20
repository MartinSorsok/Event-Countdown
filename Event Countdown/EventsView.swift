//
//  EventsView.swift
//  Event Countdown
//
//  Created by Martin, Sorsok on 20/06/2024.
//

import SwiftUI

struct EventsView: View {
    @State private var events: [Event] = []
    @State private var selectedEvent: Event?
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(events) { event in
                    NavigationLink(destination: EventForm(mode: .edit(event)) { updatedEvent in
                        if let index = events.firstIndex(where: { $0.id == event.id }) {
                            events[index] = updatedEvent
                            events.sort()
                        }
                    }) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: deleteEvent)
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: EventForm(mode: .add) { newEvent in
                        events.append(newEvent)
                        events.sort()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func deleteEvent(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }
}
