//
//  MarsRoverClientTests.swift
//  MarsRoverClientTests
//
//  Created by Percy Ngan on 12/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class MarsRoverClientTests: XCTestCase {

	func testFetchMarsRover() {
		let mockLoader = MockLoader(data: validSol1JSON, response: nil, error: nil)
		let marsRoverClient = MarsRoverClient(networkLoader: mockLoader)
		let expectation = self.expectation(description: "A valid rover exists")

		marsRoverClient.fetchMarsRover(named: "Curiosity") { (marsRover, error) in
			XCTAssert(marsRover != nil)
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5)
	}

	func testFetchPhotos() {
		let mockLoader = MockLoader(data: validRoverJSON, response: nil, error: nil)
		let marsRoverClient = MarsRoverClient(networkLoader: mockLoader)
		let expectation = self.expectation(description: "A valid set of photos exists")

		marsRoverClient.fetchPhotos(from: validRoverJSON, onSol: 0) { (photos, error) in
			XCTAssert(photos =! nil)
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5)
	}
}
