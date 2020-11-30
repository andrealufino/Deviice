import XCTest
@testable import Deviice

final class DeviiceTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Deviice().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
