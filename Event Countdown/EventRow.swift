//
//  EventRow.swift
//  Event Countdown
//
//  Created by Martin, Sorsok on 20/06/2024.
//

import SwiftUI

struct EventRow: View {
    var event: Event
    
    @State private var currentDate = Date()
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .foregroundColor(event.textColor)
            Text(remainingTime)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .onReceive(timer) { input in
            currentDate = input
        }
    }
    
    private var remainingTime: String {
        let formatter = RelativeDateTimeFormatter()
        return formatter.localizedString(for: event.date, relativeTo: currentDate)
    }
}
