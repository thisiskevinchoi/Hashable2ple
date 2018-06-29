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
