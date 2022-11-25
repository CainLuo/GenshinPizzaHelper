//
//  WatchWidgetSettingView.swift
//  WatchHelper WatchKit Extension
//
//  Created by 戴藏龙 on 2022/11/25.
//

import Foundation
import SwiftUI
import WidgetKit

struct WatchWidgetSettingView: View {
    @AppStorage("lockscreenWidgetRefreshFrequencyInMinute", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var lockscreenWidgetRefreshFrequencyInMinute: Double = 60
    @AppStorage("homeCoinRefreshFrequencyInHour", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var homeCoinRefreshFrequency: Double = 30

    @AppStorage("watchWidgetUseSimplifiedMode", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var watchWidgetUseSimplifiedMode: Bool = true

    var body: some View {
        List {
            Section {
                NavigationLink {
                    QueryFrequencySettingView()
                } label: {
                    HStack {
                        Text("小组件请求频率")
                        Spacer()
                        Text(String(format: NSLocalizedString("每%lld分钟", comment: ""), Int(lockscreenWidgetRefreshFrequencyInMinute)))
                            .foregroundColor(.accentColor)
                    }
                }
            }
            Section {
                Toggle("使用简洁模式", isOn: $watchWidgetUseSimplifiedMode)
            } footer: {
                Text("仅国服用户。更改该项需要重新添加小组件。")
            }
            if watchWidgetUseSimplifiedMode {
                Section {
                    NavigationLink {
                        HomeCoinRecoverySettingView()
                    } label: {
                        HStack {
                            Text("洞天宝钱回复速度")
                            Spacer()
                            Text(String(format: NSLocalizedString("每小时%lld个", comment: ""), Int(homeCoinRefreshFrequency)))
                                .foregroundColor(.accentColor)
                        }
                    }
                } footer: {
                    Text("（仅简洁模式）未正确设置可能导致洞天宝钱数量不准确。")
                }
            }
        }
        .onChange(of: watchWidgetUseSimplifiedMode) { newValue in
            if #available(watchOSApplicationExtension 9.0, *) {
                WidgetCenter.shared.invalidateConfigurationRecommendations()
            }
        }

    }
}

private struct QueryFrequencySettingView: View {
    @AppStorage("lockscreenWidgetRefreshFrequencyInMinute", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var lockscreenWidgetRefreshFrequencyInMinute: Double = 60
    var body: some View {
        VStack {
            Text("小组件请求频率").foregroundColor(.accentColor)
            Text(String(format: NSLocalizedString("每%lld分钟", comment: ""), Int(lockscreenWidgetRefreshFrequencyInMinute)))
                .font(.title3)
            Slider(value: $lockscreenWidgetRefreshFrequencyInMinute,
                   in: 30...270,
                   step: 10,
                   label: {
                Text("\(lockscreenWidgetRefreshFrequencyInMinute)")
            })
        }

    }
}

private struct HomeCoinRecoverySettingView: View {
    @AppStorage("homeCoinRefreshFrequencyInHour", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var homeCoinRefreshFrequency: Double = 30

    var body: some View {
        VStack {
            Text("洞天宝钱回复速度").foregroundColor(.accentColor)
            Text(String(format: NSLocalizedString("每小时%lld个", comment: ""), Int(homeCoinRefreshFrequency)))
                .font(.title3)
            Slider(value: $homeCoinRefreshFrequency,
                   in: 4...30,
                   step: 2,
                   label: {
                Text("\(homeCoinRefreshFrequency)")
            })
        }

    }
}