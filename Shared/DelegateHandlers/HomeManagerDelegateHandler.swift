//
//  HomeManagerDelegateHandler.swift
//  iOS
//
//  Created by Takahiko Inayama on 2020/06/29.
//

import Foundation
import HomeKit

class HomeManagerDelegateHandler: NSObject {
    static var _shared: HomeManagerDelegateHandler?
    static func shared() -> HomeManagerDelegateHandler {
        if let obj = _shared {
            return obj
        } else {
            let obj = HomeManagerDelegateHandler.init(store: mainState.homeList)
            _shared = obj
            return obj
        }
    }
    
    let homeManager = HMHomeManager()
    private var store: HomeListStore
    
    private init(store: HomeListStore) {
        self.store = store
        super.init()
        
        homeManager.delegate = self
    }

}

extension HomeManagerDelegateHandler: HMHomeManagerDelegate {
    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        store.dispatch(UpdateHomeListAction(update: manager.homes))
    }
    
    func homeManagerDidUpdatePrimaryHome(_ manager: HMHomeManager) {
        store.dispatch(UpdateHomeListAction(update: manager.homes))
    }
}
