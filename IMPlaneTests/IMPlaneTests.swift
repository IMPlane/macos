//
//  IMPlaneTests.swift
//  IMPlaneTests
//
//  Created by 竹村太希 on 2022/06/21.
//

import XCTest
@testable import IMPlane

class IMPlaneTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsPrintable() throws {
        assert(IMPlane.isPrintable("hoge"), "\"hoge\" should be printable.")
        assert(IMPlane.isPrintable("あいうえお"), "\"あいうえお\" sould be printable.")
        assert(IMPlane.isPrintable("123-90893*&^9830927'a;./,.ds"), "\"123-90893*&^9830927'a;./,.ds\" should be printable")
        assert(!IMPlane.isPrintable("\n"), "new line string should not be printable.")
        assert(!IMPlane.isPrintable("\t"), "tab string should not be printable.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
