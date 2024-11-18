//
//  AddActivity.swift
//  Habit Tracking
//
//  Created by Anna Filin on 23/10/2024.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    @State private var completionCount = 0
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.13, green: 0.19, blue: 0.25)
                    .ignoresSafeArea()
                
                Form {
                    TextField("Title", text: $title)
                        .font(.title)
                        .foregroundStyle(Color(red: 0.73, green: 0.79, blue: 0.75))
                        .padding()
                    
                    TextField("Description", text: $description)
                        .padding()
                        .font(.title2)
                        
                }
                .fontWeight(.bold)
                .scrollContentBackground(.hidden)
                .navigationTitle("New habit")

                .toolbar {
                    Button("Save") {
                        let item = ActivityItem(title: title,  description: description, completionCount: 0)
                        activities.items.append(item)
                        dismiss()
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.teal)
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                }
                .preferredColorScheme(.dark)
            }
        }
    }
}

#Preview {
    AddActivity(activities: Activities())
}
