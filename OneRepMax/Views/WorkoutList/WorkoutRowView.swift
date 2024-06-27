//
//  WorkoutGroupView.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import SwiftUI

struct WorkoutRowView: View {
    var workout: Workout
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading) {
                Text(workout.exercise)
                    .font(.title)
                Text("One Rep Max • lbs")
            }
            
            Spacer()
            
            if let oneRepMax = workout.oneRepMax {
                Text("\(oneRepMax)")
                    .font(.title)
            }
        }
    }
}

#Preview {
    WorkoutRowView(workout: .init(entries: [], exercise: "Deadlift"))
}
