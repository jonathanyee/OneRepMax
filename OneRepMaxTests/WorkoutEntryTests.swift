//
//  WorkoutEntryTests.swift
//  OneRepMaxTests
//
//  Created by Jonathan Yee on 6/26/24.
//

import XCTest
@testable import OneRepMax

final class WorkoutEntryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOneRepMax() throws {
        XCTAssertEqual(WorkoutEntry(date: .now, exercise: "", reps: 6, weight: 245).oneRepMax, 285)
        XCTAssertEqual(WorkoutEntry(date: .now, exercise: "", reps: 4, weight: 125).oneRepMax, 136)
        XCTAssertEqual(WorkoutEntry(date: .now, exercise: "", reps: 10, weight: 45).oneRepMax, 60)
        XCTAssertEqual(WorkoutEntry(date: .now, exercise: "", reps: 8, weight: 110).oneRepMax, 137)
        XCTAssertEqual(WorkoutEntry(date: .now, exercise: "", reps: 5, weight: 205).oneRepMax, 231)
    }
}
