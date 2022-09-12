//
//  LockScreenResinWidgetCorner.swift
//  GenshinPizzaHelper
//
//  Created by 戴藏龙 on 2022/9/12.
//

import SwiftUI

@available(iOSApplicationExtension 16.0, *)
struct LockScreenResinWidgetCorner: View {
    @Environment(\.widgetRenderingMode) var widgetRenderingMode

    let result: FetchResult
    var text: String {
        switch result {
        case .success(let data):
            return "\(data.resinInfo.currentResin), \(data.resinInfo.recoveryTime.completeTimePointFromNowShort())"
        case .failure(_):
            return "..."
        }
    }

    var body: some View {
        Image("icon.resin")
            .resizable()
            .scaledToFit()
            .padding(5)
            .widgetLabel(text)
    }
}

