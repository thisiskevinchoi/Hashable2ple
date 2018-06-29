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

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {

        typealias NameAndAge = Hashable2ple<String, Int>
        var dictionary: Dictionary<NameAndAge, Int> = Dictionary()

        let kev = NameAndAge("Kev", 21)
        dictionary[kev] = 1

        XCTAssertEqual(1, dictionary[NameAndAge("Kev", 21)])

    }

    func testExample2() {

        enum State {
            case black, red, green, blue
        }

        enum Event {
            case done, cancel, reset
        }

        typealias State_Event = Hashable2ple<State, Event>

        let dictionary: Dictionary<State_Event, State> = [
            State_Event(.black, .cancel): .red,
            State_Event(.black, .done): .black,
            State_Event(.red, .cancel): .black,
            State_Event(.red, .done): .green,
            State_Event(.green, .cancel): .black,
            State_Event(.green, .done): .blue,
            State_Event(.blue, .cancel): .black,
            State_Event(.blue, .done): .red,
        ]

        for (key, _) in dictionary {
            print("hash of key=", key.hashValue)
        }
        
    }


    func testExample3() {

        enum State {
            case black, red, green, blue
        }

        enum Event {
            case done, cancel, reset
        }

        typealias State_Event = HashableTuple<State, Event>

        let dictionary: Dictionary<State_Event, State> = [
            State_Event(.black, .cancel): .red,
            State_Event(.black, .done): .black,
            State_Event(.red, .cancel): .black,
            State_Event(.red, .done): .green,
            State_Event(.green, .cancel): .black,
            State_Event(.green, .done): .blue,
            State_Event(.blue, .cancel): .black,
            State_Event(.blue, .done): .red,
            ]

        for (key, _) in dictionary {
            print("hash of key=", key.hashValue)
        }

    }
}
