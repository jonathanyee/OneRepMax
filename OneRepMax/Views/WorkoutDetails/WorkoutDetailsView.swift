//
//  WorkoutDetailsView.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import Charts
import SwiftUI

struct WorkoutDetailsView: View {
    var workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            WorkoutRowView(workout: workout)
            
            Chart(workout.entries) { entry in
                LineMark(
                    x: .value(
                        "Date",
                        entry.date
                    ),
                    y: .value(
                        "1RM",
                        entry.oneRepMax
                    )
                )
                .symbol(Circle())
            }
            .aspectRatio(1, contentMode: .fit)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WorkoutDetailsView(workout: Workout(entries: [], exercise: "Bench press", oneRepMaxPR: 360))
}
