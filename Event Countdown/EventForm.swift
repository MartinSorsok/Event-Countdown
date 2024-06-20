//
//  EventForm.swift
//  Event Countdown
//
//  Created by Martin, Sorsok on 20/06/2024.
//

import SwiftUI

enum EventFormMode {
    case add
    case edit(Event)
}

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var textColor: Color = .black
    
    var mode: EventFormMode
    var onSave: (Event) -> Void
    
    var body: some View {
        Form {
            Section(header: Text("Event Details")) {
                TextField("Title", text: $title)
                DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                ColorPicker("Text Color", selection: $textColor)
            }
        }
        .navigationTitle(navigationTitle)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    let newEvent = Event(id: UUID(), title: title, date: date, textColor: textColor)
                    onSave(newEvent)
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
        .onAppear {
            if case let .edit(event) = mode {
                title = event.title
                date = event.date
                textColor = event.textColor
            }
        }
    }
    
    private var navigationTitle: String {
        switch mode {
        case .add:
            return "Add Event"
        case .edit:
            return "Edit Event"
        }
    }
}
