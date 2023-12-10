//
//  ResinInfoBar.swift
//  GenshinPizzaHepler
//
//  Created by 戴藏龙 on 2022/8/7.
//

import HoYoKit
import SFSafeSymbols
import SwiftUI
import WidgetKit

struct HomeCoinInfoBar: View {
    let entry: any TimelineEntry
    let homeCoinInfo: HomeCoinInformation

    var isHomeCoinFullImage: some View {
        (homeCoinInfo.calculatedCurrentHomeCoin(referTo: entry.date) == homeCoinInfo.maxHomeCoin)
            ? Image(systemSymbol: .exclamationmark)
            .overlayImageWithRingProgressBar(
                Double(homeCoinInfo.calculatedCurrentHomeCoin(referTo: entry.date)) / Double(homeCoinInfo.maxHomeCoin),
                scaler: 0.78
            )
            : Image(systemSymbol: .leafFill)
            .overlayImageWithRingProgressBar(
                Double(homeCoinInfo.calculatedCurrentHomeCoin(referTo: entry.date)) /
                    Double(homeCoinInfo.maxHomeCoin)
            )
    }

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image("洞天宝钱")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .shadow(color: .white, radius: 1)
            isHomeCoinFullImage
                .frame(maxWidth: 13, maxHeight: 13)
                .foregroundColor(Color("textColor3"))
            HStack(alignment: .lastTextBaseline, spacing: 1) {
                Text("\(homeCoinInfo.calculatedCurrentHomeCoin(referTo: entry.date))")
                    .lineLimit(1)
                    .foregroundColor(Color("textColor3"))
                    .font(.system(.body, design: .rounded))
                    .minimumScaleFactor(0.2)
            }
        }
    }
}
