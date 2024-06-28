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
    @ObservationIgnored
    private let workoutParser: WorkoutParserProtocol
    
    @ObservationIgnored
    private var exerciseNames = Set<String>()
    
    var workouts = [Workout]()
    
    init(workoutParser: WorkoutParserProtocol) {
        self.workoutParser = workoutParser
        
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
            let oneRepMax = exercises.map { $0.oneRepMax }.max()
            let workout = Workout(entries: exercises, exercise: exercise, oneRepMaxPR: oneRepMax ?? 0)
            workouts.append(workout)
        }
    }
}
