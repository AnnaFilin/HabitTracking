//
//  ContentView.swift
//  Habit Tracking
//
//  Created by Anna Filin on 23/10/2024.
//

import SwiftUI

struct ActivityItem: Identifiable, Codable, Equatable , Hashable{
    var id = UUID()
    let title: String
    let description: String
    var completionCount: Int
}

@Observable
class Activities: Codable {
    var items: [ActivityItem]

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "activities") {
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
    
    func save() {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
}




struct ContentView: View {
    @State private var showingAddActivity = false
    @State var activities = Activities()
    
    var body: some View {
                  
        NavigationStack {
            ZStack {
                Color(red: 0.13, green: 0.19, blue: 0.25)
                    .ignoresSafeArea()
                
                List {
                    ForEach(activities.items) { activity in
                        NavigationLink(value: activity) {
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    Text(activity.title)
                                        .font(.title)
                                        .padding(2)
                                        .fontWeight(.bold)
                                    
                                    Text("Completed: \(activity.completionCount) times")
                                        .font(.title2)
                                        .foregroundStyle(Color(red: 0.73, green: 0.79, blue: 0.75))
                                }
                            }
                        }
                    }
                }
               
                .scrollContentBackground(.hidden)
                .navigationTitle("Habit tracking")
                .toolbar {
                    Button("Add Activity", systemImage: "plus") {
                        showingAddActivity = true
                    }
                }
                .sheet(isPresented: $showingAddActivity) {
                    AddActivity(activities: activities)
                }
                .navigationDestination(for: ActivityItem.self) { activity in
                    ActivityDetailsView(activity: activity, activities: activities)
                }
                .preferredColorScheme(.dark)
            }
        }
    }
}

#Preview {
    let mockActivities = Activities()
    mockActivities.items = [
        ActivityItem(title: "Learn Swift", description: "Practice SwiftUI every day", completionCount: 5),
        ActivityItem(title: "Workout", description: "Exercise for at least 30 minutes", completionCount: 3)
    ]

    return AppBackgroundView {
        ContentView(activities: mockActivities)
    }
}
