//
//  SensorBookmarkActions.swift
//  Watchcat
//
//  Created by Takahiko Inayama on 2020/07/01.
//

import Foundation

protocol SensorBookmarkActions: Action {
    func apply(oldBookmarks: [SensorBookmark]) -> [SensorBookmark]
}
