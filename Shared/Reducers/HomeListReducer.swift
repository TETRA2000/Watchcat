//
//  HomeReducer.swift
//  iOS
//
//  Created by Takahiko Inayama on 2020/06/29.
//

import Foundation


func homeListReducer(action: Action, state: HomeListState?) -> HomeListState {
    guard var state = state else {
        return HomeListState()
    }
    
    var homeList = state.homeList
    homeList = passActionToRequestToUpdate(action, homeList: homeList)
    homeList = passActionToUpdate(action, homeList: homeList)
    state.homeList = homeList

    return state
}


private func passActionToRequestToUpdate(_ action: Action, homeList: HomeList) -> HomeList {

    guard let action = action as? RequestToUpdateHomeListAction else { return homeList }

    return action.apply(oldHomeList: homeList)
}


private func passActionToUpdate(_ action: Action, homeList: HomeList) -> HomeList {

    guard let action = action as? UpdateHomeListAction else { return homeList }

    return action.apply(oldHomeList: homeList)
}
