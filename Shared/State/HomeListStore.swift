//
//  HomeStore.swift
//  iOS
//
//  Created by Takahiko Inayama on 2020/06/29.
//

import Foundation
import ReSwift

typealias HomeListStore = Store<HomeListState>

func homeListStore() -> HomeListStore {
    return HomeListStore(reducer: homeListReducer, state: nil)
}
