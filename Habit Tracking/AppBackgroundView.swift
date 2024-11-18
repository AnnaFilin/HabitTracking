//
//  AppBackgroundView.swift
//  Habit Tracking
//
//  Created by Anna Filin on 17/11/2024.
//

import SwiftUI


struct AppBackgroundView<Content: View>: View {
    var backgroundColor = Color(red: 0.13, green: 0.19, blue: 0.25)
   

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color(red: 0.73, green: 0.19, blue: 0.25)
                .ignoresSafeArea()
            
            content
        }
    }
}

#Preview {
    AppBackgroundView {
        let mockActivities = Activities()
        mockActivities.items = [
            ActivityItem(title: "Learn Swift", description: "Practice SwiftUI every day", completionCount: 5),
            ActivityItem(title: "Workout", description: "Exercise for at least 30 minutes", completionCount: 3)
        ]
        return ContentView(activities: mockActivities)
    }
}
