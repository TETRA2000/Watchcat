//
//  HomeActions.swift
//  iOS
//
//  Created by Takahiko Inayama on 2020/06/29.
//

import Foundation
import HomeKit

protocol HomeListAction: Action {
    func apply(oldHomeList: HomeList) -> HomeList
}

struct RequestToUpdateHomeListAction: HomeListAction {
    func apply(oldHomeList: HomeList) -> HomeList {
        var result = oldHomeList
        let handler = HomeManagerDelegateHandler.shared()
        result.homes = handler.homeManager.homes
        return result
    }
}

struct UpdateHomeListAction: HomeListAction {
    var homeList: [HMHome]
    init(update homeList: [HMHome]) {
        self.homeList = homeList
    }
    
    func apply(oldHomeList: HomeList) -> HomeList {
        var result = oldHomeList
        result.homes = homeList
        return result
    }
}
