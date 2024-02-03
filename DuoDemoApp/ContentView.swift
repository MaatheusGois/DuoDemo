//
//  ContentView.swift
//  DuoDemoApp
//
//  Created by Matheus Gois on 03/02/2024.
//

import ActivityKit
import SwiftUI

@available(iOS 16.1, *)
struct ContentView: View {
    @ObservedObject var manager = ActivityManager()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Create an activity to start a live activity").fontWeight(.ultraLight)

                    Button(action: {
                        manager.createActivity()
                        manager.listAllDeliveries()
                    }) {
                        Text("Create Activity")
                    }

                    Button(action: {
                        manager.listAllDeliveries()
                    }) {
                        Text("List All Activities")
                    }

                    Button(action: {
                        manager.endAllActivity()
                        manager.listAllDeliveries()
                    }) {
                        Text("End All Activites")
                    }
                }
                if !manager.activities.isEmpty {
                    Section {
                        Text("Live Activities")

                        activitiesView()
                    }
                }
            }
            .navigationTitle("DuoDemo!")
        }
    }
}

// MARK: - List

@available(iOS 16.1, *)
extension ContentView {

    func activitiesView() -> some View {
        ScrollView {
            ForEach(manager.activities, id: \.id) { activity in
                activityView(activity)
            }
        }
    }

    func activityView(_ activity: Activity<DuoDemoAppAttributes>) -> some View {

        return HStack(alignment: .center) {
            Text("\(activity.contentState.progressString)% -")
            Text(activity.contentState.initialTime, style: .timer)
            Text("update")
                .font(.headline)
                .foregroundColor(.green)
                .onTapGesture {
                    manager.update(activity: activity)
                    manager.listAllDeliveries()
                }
            Text("end")
                .font(.headline)
                .foregroundColor(.red)
                .onTapGesture {
                    manager.end(activity: activity)
                    manager.listAllDeliveries()
                }
        }.padding(.vertical)
    }
}
