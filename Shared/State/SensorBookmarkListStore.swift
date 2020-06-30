//
//  SensorBookmarkStore.swift
//  iOS
//
//  Created by Takahiko Inayama on 2020/07/01.
//

import Foundation
import ReSwift

typealias SensorBookmarkListStore = Store<SensorBookmarkListState>

func sensorBookmarkListStore() -> SensorBookmarkListStore {
    return SensorBookmarkListStore(reducer: sensorBookmarkListReducer, state: nil)
}

