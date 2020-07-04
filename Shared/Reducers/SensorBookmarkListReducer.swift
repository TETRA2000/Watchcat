//
//  SensorBookmarkReducer.swift
//  iOS
//
//  Created by Takahiko Inayama on 2020/07/01.
//

import Foundation

func sensorBookmarkListReducer(action: Action, state: SensorBookmarkListState?) -> SensorBookmarkListState {
    guard var state = state else {
        return SensorBookmarkListState()
    }

    return state
}
