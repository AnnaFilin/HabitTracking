//
//  ActivityDetailsView.swift
//  Habit Tracking
//
//  Created by Anna Filin on 24/10/2024.
//

import SwiftUI

struct ActivityDetailsView: View {
    var buttonColor = Color(red: 0.33, green: 0.79, blue: 0.25)
    
    @State var activity: ActivityItem
    var activities: Activities
    
    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.19, blue: 0.25)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(activity.title)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.bottom )
                
                Text(activity.description)
                    .font(.title)
                
                Text("Completion Count: \(activity.completionCount)")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.top)
                
                Spacer()
                
                Button("Mark as Completed") {
                    if let index = activities.items.firstIndex(of: activity) {
                        var updatedActivity = activities.items[index]
                        updatedActivity.completionCount += 1
                        self.activity = updatedActivity
                        activities.items[index] = updatedActivity
                        activities.save()
                    }
                }
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 20)
                .background(
                    buttonColor
                        .cornerRadius(10)
                        .shadow(radius: 5)
                )
                
                Spacer()
            }
        }
    }
}


#Preview {
    let mockActivities = Activities()
    let mockActivity = ActivityItem(title: "Sample Habit", description: "This is a test habit.", completionCount: 1)
    mockActivities.items.append(mockActivity)
    return ActivityDetailsView( activity: mockActivity, activities: mockActivities)
}
