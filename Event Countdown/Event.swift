//
//  Event.swift
//  Event Countdown
//
//  Created by Martin, Sorsok on 20/06/2024.
//

import SwiftUI

struct Event: Identifiable, Comparable {
    let id: UUID
    var title: String
    var date: Date
    var textColor: Color
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        return lhs.date < rhs.date
    }
}
