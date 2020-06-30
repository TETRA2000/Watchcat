//
//  Store.swift
//  iOS
//
//  Created by Takahiko Inayama on 2020/06/29.
//

import Foundation
import ReSwift

typealias Action = ReSwift.Action

struct State {
    let homeList = homeListStore()
    let sensorBookmarkList = sensorBookmarkListStore()
}

let mainState = State()
