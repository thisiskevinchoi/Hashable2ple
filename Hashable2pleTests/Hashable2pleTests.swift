//
//  Hashable2pleTests.swift
//  Hashable2pleTests
//
//  Created by Kevin Choi on 7/18/14.
//  Copyright (c) 2014 Kevin Choi. All rights reserved.
//

import UIKit
import XCTest
@testable import Hashable2ple


/*
 How to use Hashable2ple
 I would recommend using a typealias on the struct to shorten the name (create an alias of the specialized Hashable2ple type, since Hashable2ple makes use of generics)
 Both elements in Hashable2ple must also be hashable!

 typealias NameAndAge = Hashable2ple<String, Int>

 Create a dictionary using the specialized Hashable2ple type
 var dictionary: Dictionary<NameAndAge, Int> = Dictionary()

 Create a key
 let kev = NameAndAge("Kev", 21)
 
 Finally, add the key-value pair to the dictionary!
 dictionary(kev) = 1
 */


class Hashable2pleTests: XCTestCase {

    typealias NameAndAge = Hashable2ple<String, Int>
    var dictionary: Dictionary<NameAndAge, Int> = Dictionary()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {

        let kev = NameAndAge("Kev", 21)
        dictionary[kev] = 1

        XCTAssertEqual(1, dictionary[NameAndAge("Kev", 21)])

    }
    
}
