//
//  DuoTrackWidget.swift
//  DuoTrackWidget
//
//  Created by Matheus Gois on 03/02/2024.
//

import ActivityKit
import SwiftUI
import WidgetKit

@main
struct Widgets: WidgetBundle {
    var body: some Widget {
        if #available(iOS 16.1, *) {
            DuoDemoApp()
        }
    }
}

@available(iOSApplicationExtension 16.1, *)
struct DuoDemoApp: Widget {

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DuoDemoAppAttributes.self) { context in
            LockScreenView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    dynamicIslandExpandedLeadingView(context: context)
                }

                DynamicIslandExpandedRegion(.trailing) {
                    dynamicIslandExpandedTrailingView(context: context)
                }

                DynamicIslandExpandedRegion(.center) {
                    dynamicIslandExpandedCenterView(context: context)
                }

                DynamicIslandExpandedRegion(.bottom) {
                    dynamicIslandExpandedBottomView(context: context)
                }

            } compactLeading: {
                compactLeadingView(context: context)
            } compactTrailing: {
                compactTrailingView(context: context)
            } minimal: {
                minimalView(context: context)
            }
            .keylineTint(.green)
        }
    }

    // MARK: Expanded Views

    func dynamicIslandExpandedLeadingView(context: ActivityViewContext<DuoDemoAppAttributes>) -> some View {
        VStack {
            Label {
                Text("\(context.attributes.numberOfGroceyItems)")
                    .font(.title2)
            } icon: {
                Image("duo-icon")
            }
            Text("items")
                .font(.title2)
        }
    }

    func dynamicIslandExpandedTrailingView(context: ActivityViewContext<DuoDemoAppAttributes>) -> some View {
        Label {
            Text(verbatim: "Text")
                .multilineTextAlignment(.trailing)
                .frame(width: 50)
                .monospacedDigit()
        } icon: {
            Image(systemName: "timer")
                .foregroundColor(.green)
        }
        .font(.title2)
    }

    func dynamicIslandExpandedBottomView(context: ActivityViewContext<DuoDemoAppAttributes>) -> some View {
        Label("Call courier", systemImage: "phone")
    }

    func dynamicIslandExpandedCenterView(context: ActivityViewContext<DuoDemoAppAttributes>) -> some View {
        Text("\(context.state.courierName) is on the way!")
            .lineLimit(1)
            .font(.caption)
    }

    // MARK: Compact Views

    func compactLeadingView(context: ActivityViewContext<DuoDemoAppAttributes>) -> some View {
        VStack {
            Label {
                Text("\(context.attributes.numberOfGroceyItems) items")
            } icon: {
                Image("duo-icon")
                    .resizable()
                    .scaledToFit()
            }
            .font(.caption2)
        }
    }

    func compactTrailingView(context: ActivityViewContext<DuoDemoAppAttributes>) -> some View {
        Text(verbatim: "Trailing")
            .multilineTextAlignment(.center)
            .frame(width: 40)
            .font(.caption2)
    }

    func minimalView(context: ActivityViewContext<DuoDemoAppAttributes>) -> some View {
        VStack(alignment: .center) {
            Image(systemName: "timer")
            Text(verbatim: "MinimalView")
                .multilineTextAlignment(.center)
                .monospacedDigit()
                .font(.caption2)
        }
    }
}

@available(iOSApplicationExtension 16.1, *)
struct LockScreenView: View {
    var context: ActivityViewContext<DuoDemoAppAttributes>
    var body: some View {
        let url = URL(string: DeepLink.home(number: 1).url)
        return Link(destination: url!) {
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                ProgressBar(progress: context.state.percentage)
                                    .frame(minHeight: 16)
                                    .padding(.bottom, 6)
                            }

                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Finish your homework!")
                                        .font(.title3)
                                        .fontWeight(.bold)

                                    Text("It's been \(context.attributes.numberOfGroceyItems) since you started.")
                                        .font(.headline)
                                        .fontWeight(.thin)
                                }
                                Spacer()
                            }
                        }
                    }.padding(10)
                }.padding(15)

                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Image("duo-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40*4, height: 28*4)
                    }
                }
            }
        }
    }
}

struct ProgressBar: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.2))
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )

                Rectangle()
                    .foregroundColor(Color("action"))
                    .frame(
                        width: min(
                            self.progress * geometry.size.width,
                            geometry.size.width
                        ),
                        height: geometry.size.height
                    )
                    .cornerRadius(10.0)
            }
            .cornerRadius(10.0)
        }
    }
}
