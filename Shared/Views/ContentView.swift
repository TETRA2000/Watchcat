//
//  ContentView.swift
//  Shared
//
//  Created by Takahiko Inayama on 2020/06/28.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var state = ObservableState(store: mainHomeListStore)

    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!").padding()
                
                List(state.current.homeList.homes, id: \.uniqueIdentifier) { home in
                    Text(home.name)
                }
            }
        }.onAppear(perform: state.dispatch(RequestToUpdateHomeListAction()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

