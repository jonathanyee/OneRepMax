//
//  WorkoutListViewModel.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import Foundation
import Observation
import SwiftUI

@Observable
class WorkoutListViewModel {
    private let workoutParser = WorkoutParser()
    
    var workouts = [Workout]()
    var exerciseNames = Set<String>()
    
    init() {
        guard 
            let entries = workoutParser.parse()
        else {
            return
        }
        
        for entry in entries {
            exerciseNames.insert(entry.exercise)
        }
        
        for exercise in exerciseNames {
            let exercises = entries.filter( { $0.exercise == exercise })
            let workout = Workout(entries: exercises, exercise: exercise, oneRepMax: 0) // TODO
            workouts.append(workout)
        }
    }
}
