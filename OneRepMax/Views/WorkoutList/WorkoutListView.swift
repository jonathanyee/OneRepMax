//
//  ContentView.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import SwiftUI

struct WorkoutListView: View {
    @State var viewModel = WorkoutListViewModel(workoutParser: WorkoutParser())
    
    var body: some View {
        NavigationStack {
            List(viewModel.workouts) { workout in
                NavigationLink(destination: WorkoutDetailsView(workout: workout)) {
                    WorkoutRowView(workout: workout)
                }
            }
        }
    }
}

#Preview {
    WorkoutListView()
}
