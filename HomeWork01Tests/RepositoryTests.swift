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

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoryExistence() {
        XCTAssertNotNil(Repository.factory)
    }
    
    func testRepositoryContactsExistence() {
        var contactList: [Contact]?
        let expectations = expectation(description: "Contacts list")
        Repository.factory.getContacts(completion: {
            contactList = $0
            expectations.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(contactList)
    }
    
    func testRepositoryContactCount() {
        var contactList: [Contact]?
        let expectations = expectation(description: "Contacts list count")
        Repository.factory.getContacts(completion: {
            contactList = $0
            expectations.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(contactList?.count, 10)
        print("Número de contactos descargados: \(contactList!.count)")
    }
    
    
}
