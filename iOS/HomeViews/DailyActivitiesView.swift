//
//  DailyActivitiesView.swift
//  iLegym (iOS)
//
//  Created by Bill Haku on 2022/3/12.
//

import SwiftUI

struct DailyActivitiesView: View {
    @State var activities: UserActivityListData? = nil

    var body: some View {
        NavigationView {
            if activities == nil {
                Text("Load activities fail")
            } else {
                VStack {
                    List {
                        ForEach(activities!.items, id: \.self) { activity in
                            DailyActivityCell(activity: activity)
                        }
                    }
                }
                .navigationTitle("每日运动")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
        .onAppear() {
            if activities == nil {
                API.Activity.getActivityList() { apiActivities, _ in
                    activities = apiActivities
                }
            }
        }
    }
}

private struct DailyActivityCell: View {
    var activity: UserActivityListData.ItemUnit
    @State var isChosen: Bool = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(activity.name)
                Text(activity.stateName)
                    .font(.caption)
            }
            Spacer()
            Button(action: sign) {
                Text("打卡")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .foregroundColor(.white)
                    .background(activity.state == 4 ? Color.blue : Color.gray)
                    .clipShape(Capsule())
                    .disabled(activity.state != 4)
            }
        }
    }

    func sign() -> Void {
        API.Activity.sign(userid: UserDefaults.standard.string(forKey: "id") ?? "", activityid: activity.id) { res, _ in
            print("\(res?.code ?? -1) - \(res?.message ?? "res message nil")")
        }
    }
}
