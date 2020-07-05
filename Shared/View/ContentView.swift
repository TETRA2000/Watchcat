//
//  ContentView.swift
//  Shared
//
//  Created by Takahiko Inayama on 2020/06/28.
//

import SwiftUI
import HomeKit

struct ContentView: View {
    @ObservedObject private var state = ObservableState(store: mainState.homeList)

    var body: some View {
        NavigationView {
            List(state.current.homeList.homes, id: \.uniqueIdentifier) { home in
                NavigationLink(destination: AccessorieslView(homeName: home.name, accessories: home.accessories)) {
                    Text(home.name)
                }
            }
        }.onAppear(perform: {
            state.dispatch(RequestToUpdateHomeListAction())
            DockAdapter.controller?.updateBadge("Yeah!")
        }).navigationBarTitle(Text("Homes"))
    }
}

struct AccessorieslView: View {
    var homeName: String
    var accessories: [HMAccessory]

    var body: some View {
        Group {
            if accessories.count > 0  {
                List(accessories, id: \.uniqueIdentifier) { accessory in
                    NavigationLink(destination: ServicesView(accessoryName: accessory.name, services: accessory.services)) {
                        VStack(alignment: .leading) {
                            Text(accessory.name)
                                .font(.title)
                            Text(accessory.room?.name ?? "")
                                .fontWeight(.light)
                            Text("Category: \(accessory.category.localizedDescription)")
                            Text("\(accessory.services.count) services")
                        }
                    }
                }
            } else {
                Text("No accessories.")
            }
        }.navigationBarTitle(Text(homeName))
    }
}

struct ServicesView: View {
    var accessoryName: String
    var services: [HMService]

    var body: some View {
        Group {
            if services.count > 0  {
                List(services, id: \.uniqueIdentifier) { service in
                    NavigationLink(destination: CharacteristicsView(serviceName: service.name, characteristics: service.characteristics)) {
                        VStack(alignment: .leading) {
                            Text(service.name)
                                .font(.title)
                            Text(service.localizedDescription)
                        }
                    }
                }
            } else {
                Text("No services.")
            }
        }.navigationBarTitle(Text(accessoryName))
    }
}

struct CharacteristicsView: View {
    var serviceName: String
    var characteristics: [HMCharacteristic]

    var body: some View {
        Group {
            if characteristics.count > 0  {
                List(characteristics, id: \.uniqueIdentifier) { characteristic in
                    VStack(alignment: .leading) {
                        Text(characteristic.metadata?.manufacturerDescription ?? characteristic.localizedDescription)
                            .font(.title)
                        Text(characteristic.characteristicType)
                        Text("\(characteristic.properties.joined(separator: ", "))")

                    }
                }
            } else {
                Text("No characteristics.")
            }
        }.navigationBarTitle(Text(serviceName))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

