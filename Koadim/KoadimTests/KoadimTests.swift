//
//  KoadimTests.swift
//  KoadimTests
//
//  Created by Prajwal Lobo on 23/03/18.
//  Copyright © 2018 Prajwal Lobo. All rights reserved.
//

import XCTest
@testable import Koadim

class KoadimTests: XCTestCase {
    
    var entry : Entry!
    var manager : CreditManager!
    
    override func setUp() {
        super.setUp()
        entry = Entry(credits: 5)
        manager = CreditManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        entry = nil
        manager = nil
    }
    
    func testEntry(){
        XCTAssert(entry.credits == 5, "Initial credit is set up")
    }
    
    func testAddEntry(){
        let expectation = self.expectation(description: "Should be able to add entry")
        let result = manager.add(entry: entry)
        XCTAssertTrue(result.status, "Should be able to add balance")
        XCTAssert(manager.balance == 5, "Balance added")
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)

    }
    
    func testDeductEntry(){
        let expectation = self.expectation(description: "Should be able to deduct entry")
        let result = manager.deduct(entry: entry)
        XCTAssertFalse(result.status, "Should be able to add balance")
        XCTAssert(manager.balance == 0, "Balance Deducted")
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)

    }
    
    func testOperate(){
        let expectation = self.expectation(description: "Should be able to add/deduct entry")
        let creditResult = manager.operate(entry: entry, transaction: .credit)
        XCTAssertTrue(creditResult.status, "Operated with add entry")
        let debitResult = manager.operate(entry: entry, transaction: .debit)
        XCTAssertTrue(debitResult.status, "Operated with debit entry")
        let insufficientBalance = manager.operate(entry: entry, transaction: .debit)
        XCTAssertFalse(insufficientBalance.status, "Operated with debit entry")
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
        

    }
    

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
