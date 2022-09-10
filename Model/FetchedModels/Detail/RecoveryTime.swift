//
//  RecoveryTime.swift
//  GenshinPizzaHepler
//
//  Created by 戴藏龙 on 2022/8/7.
//  回复时间计算工具

import Foundation
import CryptoKit

struct RecoveryTime {
    let second: Int
    
    init(second: Int) {
        self.second = second
    }
    
    init(_ day: Int, _ hour: Int, _ minute: Int, _ second: Int) {
        self.second = day*24*60*60 + hour*60*60 + minute*60 + second
    }
    
    var isComplete: Bool { second == 0 }
    
    func describeIntervalLong(finishedTextPlaceholder: String? = nil, unisStyle: DateComponentsFormatter.UnitsStyle = .brief) -> String {
        /// finishedTextPlaceholder: 剩余时间为0时的占位符，如“已完成”
        if let finishedTextPlaceholder = finishedTextPlaceholder {
            guard second != 0 else { return finishedTextPlaceholder }
        }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = unisStyle
        formatter.collapsesLargestUnit = false
        formatter.allowedUnits = [.day, .hour, .minute]
        // 如果超过一天，只显示天数
        formatter.maximumUnitCount = (second > 24*60*60) ? 1 : 2

        formatter.calendar = Calendar.current
        formatter.calendar!.locale = Locale(identifier: Locale.current.identifier)

        return formatter.string(from: TimeInterval(Double(second)))!
    }
    func describeIntervalShort(finishedTextPlaceholder: String? = nil, unisStyle: DateComponentsFormatter.UnitsStyle = .brief) -> String {
        /// finishedTextPlaceholder: 剩余时间为0时的占位符，如“已完成”
        if let finishedTextPlaceholder = finishedTextPlaceholder {
            guard second != 0 else { return finishedTextPlaceholder }
        }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = unisStyle
        formatter.collapsesLargestUnit = false
        formatter.allowedUnits = [.day, .hour, .minute]
        formatter.maximumUnitCount = 1

        formatter.calendar = Calendar.current
        formatter.calendar!.locale = Locale(identifier: Locale.current.identifier)

        return formatter.string(from: TimeInterval(Double(second)))!
    }
    func completeTimePointFromNow(finishedTextPlaceholder: String? = nil) -> String {
        /// finishedTextPlaceholder: 剩余时间为0时的占位符，如“已完成”
        if let finishedTextPlaceholder = finishedTextPlaceholder {
            guard second != 0 else { return finishedTextPlaceholder }
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        
        let date = Calendar.current.date(byAdding: .second, value: second, to: Date())!

        return dateFormatter.string(from: date)
    }
    
    
}

