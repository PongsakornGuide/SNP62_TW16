import XCTest
@testable import SwiftSMS

final class SwiftSMSTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftSMS().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
