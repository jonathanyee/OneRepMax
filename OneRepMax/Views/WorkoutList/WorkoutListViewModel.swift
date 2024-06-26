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
        
//        for entry in entries {
//            let exercise = entry.exercise
//            
//            if !exerciseNames.contains(exercise) {
//                exerciseNames.insert(exercise)
//                groups.append(WorkoutGroup(entries: [entry], exercise: exercise, oneRepMax: 0)) // TODO one rep max
//            } else {
//                groups.first(where: { $0.exercise == exercise })?.entries.append(entry)
//            }
//        }
        
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
