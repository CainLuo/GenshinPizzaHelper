//
//  NotificationSettingView.swift
//  GenshinPizzaHepler
//
//  Created by 戴藏龙 on 2022/8/20.
//

import SwiftUI

struct NotificationSettingView: View {
    @AppStorage("allowResinNotification", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var allowResinNotification: Bool = true
    @AppStorage("resinNotificationNum", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var resinNotificationNum: Double = 150
    @State var showResinSlider: Bool = false
    
    @AppStorage("allowHomeCoinNotification", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var allowHomeCoinNotification: Bool = true
    @AppStorage("homeCoinNotificationHourBeforeFull", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var homeCoinNotificationHourBeforeFull: Double = 8
    @State var showHomeCoinSlider: Bool = false
    
    @AppStorage("allowExpeditionNotification", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var allowExpeditionNotification: Bool = true
    @AppStorage("noticeExpeditionMethodRawValue", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var noticeExpeditionMethodRawValue: Int = 1
    
    var noticeExpeditionBy: Binding<ExpeditionNoticeMethod> {
        .init(get: {
            return .init(rawValue: self.noticeExpeditionMethodRawValue)!
        }, set: {
            self.noticeExpeditionMethodRawValue = $0.rawValue
        })
    }
    
    @AppStorage("allowWeeklyBossesNotification", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var allowWeeklyBossesNotification: Bool = true
    @AppStorage("weeklyBossesNotificationTimePointData", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var weeklyBossesNotificationTimePointData: Data = try! JSONEncoder().encode(DateComponents(calendar: Calendar.current, hour: 19, minute: 0, weekday: 7))
    var weeklyBossesNotificationTime: Binding<Date> {
        .init(get: {
            let dateComponents = try! JSONDecoder().decode(DateComponents.self, from: weeklyBossesNotificationTimePointData)
            return Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!
        }, set: {
            do {
                let dateComponents = Calendar.current.dateComponents([.calendar, .weekday, .hour, .minute], from: $0)
                let finishingDatesData = try JSONEncoder().encode(dateComponents)
                weeklyBossesNotificationTimePointData = finishingDatesData
            } catch {
                 print(error)
            }
        })
    }
    var weeklyBossesWeekday: Binding<Int> {
        .init(get: {
            let dateComponents = try! JSONDecoder().decode(DateComponents.self, from: weeklyBossesNotificationTimePointData)
            return dateComponents.weekday!
        }, set: {
            do {
                var dateComponents = try JSONDecoder().decode(DateComponents.self, from: weeklyBossesNotificationTimePointData)
                dateComponents.weekday = $0
                let finishingDatesData = try JSONEncoder().encode(dateComponents)
                weeklyBossesNotificationTimePointData = finishingDatesData
            } catch {
                 print(error)
            }
        })
    }
    
    
    @AppStorage("allowTransformerNotification", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var allowTransformerNotification: Bool = true
    
    
    @AppStorage("allowDailyTaskNotification", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var allowDailyTaskNotification: Bool = true
    @AppStorage("dailyTaskNotificationTimePointData", store: UserDefaults(suiteName: "group.GenshinPizzaHelper")) var dailyTaskNotificationTimePointData: Data = try! JSONEncoder().encode(DateComponents(calendar: Calendar.current, hour: 19, minute: 0))
    var dailyTaskNotificationTime: Binding<Date> {
        .init(get: {
            let dateComponents = try! JSONDecoder().decode(DateComponents.self, from: dailyTaskNotificationTimePointData)
            return Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!
        }, set: {
            do {
                let dateComponents = Calendar.current.dateComponents([.calendar, .hour, .minute], from: $0)
                let finishingDatesData = try JSONEncoder().encode(dateComponents)
                dailyTaskNotificationTimePointData = finishingDatesData
            } catch {
                 print(error)
            }
        })
    }
    
    
    // TODO: Ignore UIDs var ignoreUids: [String] = []
    
    
    var body: some View {
        List {
            Section {
                NavigationLink(destination: IgnoreNotificationAccountView()) {
                    Text("启用帐号")
                }
            }
            Section {
                Toggle(isOn: $allowResinNotification.animation()) {
                    Text("原粹树脂提醒推送")
                }
                if allowResinNotification {
                    HStack {
                        Text("提醒阈值")
                        Spacer()
                        Button(action: {
                            withAnimation{ showResinSlider.toggle() }
                        }) {
                            Text("\(Int(resinNotificationNum))树脂")
                        }
                    }
                    if showResinSlider {
                        Slider(value: $resinNotificationNum,
                               in: 10...160,
                               step: 5.0,
                               label: {Text("提醒阈值：\(resinNotificationNum)")})
                    }
                }
            }
            
            Section {
                Toggle(isOn: $allowHomeCoinNotification.animation()) {
                    Text("洞天宝钱提醒推送")
                }
                if allowHomeCoinNotification {
                    HStack {
                        Text("提醒时间")
                        Spacer()
                        Button(action: {
                            withAnimation{ showHomeCoinSlider.toggle() }
                            
                        }) {
                            Text("充满前\(Int(homeCoinNotificationHourBeforeFull))小时")
                        }
                    }
                    if showHomeCoinSlider {
                        Slider(value: $homeCoinNotificationHourBeforeFull,
                               in: 1...24,
                               step: 1,
                               label: {Text("提醒阈值：\(homeCoinNotificationHourBeforeFull)")})
                    }
                }
            }
            
            Section {
                Toggle(isOn: $allowExpeditionNotification.animation()) {
                    Text("探索派遣提醒推送")
                }
                if allowExpeditionNotification {
                    Picker("提醒于", selection: noticeExpeditionBy) {
                        Text("全部完成时")
                            .tag(ExpeditionNoticeMethod.allCompleted)
                        Text("下一个完成时")
                            .tag(ExpeditionNoticeMethod.nextCompleted)
                    }
                }
            }
            
            Section {
                Toggle(isOn: $allowDailyTaskNotification.animation()) {
                    Text("每日任务提醒推送")
                }
                if allowDailyTaskNotification {
                    DatePicker("提醒时间", selection: dailyTaskNotificationTime, displayedComponents: .hourAndMinute)
                }
            }
            
            Section {
                Toggle(isOn: $allowWeeklyBossesNotification.animation()) {
                    Text("周本折扣提醒推送")
                }
                if allowWeeklyBossesNotification {
                    DatePicker("提醒时间", selection: weeklyBossesNotificationTime, displayedComponents: .hourAndMinute)
                    Picker("提醒日期", selection: weeklyBossesWeekday) {
                        Text("星期一").tag(2)
                        Text("星期二").tag(3)
                        Text("星期三").tag(4)
                        Text("星期四").tag(5)
                        Text("星期五").tag(6)
                        Text("星期六").tag(7)
                        Text("星期日").tag(1)
                    }
                }
            }
            
            Toggle(isOn: $allowTransformerNotification.animation()) {
                Text("参量质变仪提醒推送")
            }
        }
        .navigationBarTitle("通知设置", displayMode: .inline)
    }
}

struct IgnoreNotificationAccountView: View {
    @EnvironmentObject var viewModel: ViewModel
    var configs: [AccountConfiguration] { viewModel.accounts.map { $0.config } }
    
    // TODO: IGNORE NOTIFICATION ACCOUNT VIEW
    
    @State var ignoreUids: [String] = []
    var bindings: [Binding<Bool>] {
        configs.map { binding($0.uid!) }
    }
    func binding(_ uid: String) -> Binding<Bool> {
        .init(get: {
            !ignoreUids.contains(uid)
        }, set: { allow in
            if allow {
                ignoreUids.append(uid)
            } else {
                ignoreUids = ignoreUids.filter { $0 != uid }
            }
        })
    }
    
    var body: some View {
        List {
            ForEach(configs, id: \.uuid) { config in
                Toggle(isOn: binding(config.uid!)) {
                    Text("\(config.name!)(\(config.uid!))")
                }
            }

        }
        
    }
    
    
}

fileprivate struct AllowAccount {
    let config: AccountConfiguration
    var isAllow: Bool
}
