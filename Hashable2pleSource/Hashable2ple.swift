//
//  Hashable2ple.swift
//  Hashable2ple
//
//  Created by Kevin Choi on 7/18/14.
//  Copyright (c) 2014 Kevin Choi. All rights reserved.
//

import Foundation

struct Hashable2ple<P1, P2>: Hashable where P1: Hashable, P2: Hashable {
    var firstProperty: P1
    var secondProperty: P2
    init(_ firstProperty: P1, _ secondProperty: P2) {
        self.firstProperty = firstProperty
        self.secondProperty = secondProperty
    }
    // http://stackoverflow.com/questions/24239295/writing-a-good-hashable-implementation-in-swift
    var hashValue: Int {
        get {
            return (31 &* firstProperty.hashValue) &+ secondProperty.hashValue
        }
    }
}

func == <T1, T2> (lhs: Hashable2ple<T1, T2>, rhs: Hashable2ple<T1, T2>) -> Bool {
    return (lhs.firstProperty.hashValue == rhs.firstProperty.hashValue) && (lhs.secondProperty.hashValue == rhs.secondProperty.hashValue)
}


/*
 Synthesizing Equatable and Hashable conformance

 https://github.com/apple/swift-evolution/blob/78332d211d00abac286c47609ce1a88a03c6e9bf/proposals/0185-synthesize-equatable-hashable.md

 Status: Implemented (Swift 4.1)

 The struct HashableTuple<P1, P2>, below, is an example of struct for which the swift compiler generates the hashValue and func ==.

 init(_ firstProperty: P1, _ secondProperty: P2) lets us avoid argument labels in the initializer call.

 The default generated init would have the signature init(firstProperty: P1, secondProperty: P2).

 */

struct HashableTuple<P1, P2>: Hashable where P1: Hashable, P2: Hashable {
    var firstProperty: P1
    var secondProperty: P2
    init(_ firstProperty: P1, _ secondProperty: P2) {
        self.firstProperty = firstProperty
        self.secondProperty = secondProperty
    }
}

