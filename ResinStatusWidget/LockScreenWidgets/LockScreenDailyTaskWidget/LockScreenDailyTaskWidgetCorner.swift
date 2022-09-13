//
//  LockScreenHomeCoinWidgetCorner.swift
//  GenshinPizzaHelper
//
//  Created by 戴藏龙 on 2022/9/12.
//

import SwiftUI

@available(iOSApplicationExtension 16.0, *)
struct LockScreenDailyTaskWidgetCorner: View {
    @Environment(\.widgetRenderingMode) var widgetRenderingMode

    let result: FetchResult

    var body: some View {
        switch result {
        case .success(let data):
            Image("icon.dailyTask")
                .resizable()
                .scaledToFit()
                .padding(4.5)
                .widgetLabel {
                    Gauge(value: Double(data.dailyTaskInfo.finishedTaskNum), in: 0...Double(data.dailyTaskInfo.totalTaskNum)) {
                        Text("每日任务")
                    } currentValueLabel: {
                        Text("\(data.dailyTaskInfo.finishedTaskNum) / \(data.dailyTaskInfo.totalTaskNum)")
                    } minimumValueLabel: {
                        Text("  \(data.dailyTaskInfo.finishedTaskNum)/\(data.dailyTaskInfo.totalTaskNum)  ")
                    } maximumValueLabel: {
                        Text("")
                    }
                }
        case.failure(_):
            Image("icon.dailyTask")
                .resizable()
                .scaledToFit()
                .padding(4.5)
                .widgetLabel {
                    Gauge(value: 0, in: 0...4) {
                        Text("")
                    }
                }
        }
    }
}