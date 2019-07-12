//
//  RepositoryTests.swift
//  HomeWork01Tests
//
//  Created by Santiago Sanchez merino on 12/07/2019.
//  Copyright © 2019 Santiago Sanchez Merino. All rights reserved.
//

import XCTest
@testable import HomeWork01

class RepositoryTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoryExistence() {
        XCTAssertNotNil(Repository.factory)
    }
    
    func testRepositoryContactsExistence() {
        XCTAssertNotNil(Repository.factory.contacts)
    }
    
    func testRepositoryContactCount() {
        Repository.factory.dispatchGroup.notify(queue: Repository.factory.dispatchQueue) {
            XCTAssertEqual(Repository.factory.contacts.count, 10)
            print("Número de contactos descargados: \(Repository.factory.contacts.count)")
        }
    }
    
    
}
