import XCTest
@testable import AnagramUI

final class AnagramUITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AnagramUI().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
