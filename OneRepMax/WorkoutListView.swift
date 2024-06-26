//
//  ContentView.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import SwiftUI

struct WorkoutListView: View {
    @State var viewModel = WorkoutListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.workouts) { workout in
                NavigationLink(destination: WorkoutListView()) {
                    WorkoutRowView(workout: workout)
                }
            }
            .navigationDestination(for: Workout.self) { group in
            }
        }
    }
}

#Preview {
    WorkoutListView()
}
