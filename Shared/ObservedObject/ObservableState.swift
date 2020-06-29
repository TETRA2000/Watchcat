//
//  ObservableState.swift
//  iOS
//
//  Created by Takahiko Inayama on 2020/06/30.
//

import Foundation
import ReSwift

// MARK: ObservableState
// https://github.com/ReSwift/ReSwift/issues/424

public class ObservableState<T>: ObservableObject where T: StateType {

    // MARK: Public properties
    
    @Published public var current: T
    
    // MARK: Private properties
    
    private var store: Store<T>
    
    // MARK: Lifecycle
    
    public init(store: Store<T>) {
        self.store = store
        self.current = store.state
        
        store.subscribe(self)
    }
    
    deinit {
        store.unsubscribe(self)
    }
    
    // MARK: Internal methods

    internal func dispatch(_ action: Action) {
        store.dispatch(action)
    }

    internal func dispatch(_ action: Action) -> () -> Void {
        {
            self.store.dispatch(action)
        }
    }
}

extension ObservableState: StoreSubscriber {
    
    // MARK: - <StoreSubscriber>
    
    public func newState(state: T) {
        DispatchQueue.main.async {
            self.current = state
        }
    }
}
