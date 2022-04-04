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
                List {
                    ForEach(activities!.items, id: \.self) { activity in
                        DailyActivityCell(activity: activity)
                    }
                }
                .refreshable {
                    API.Activity.getActivityList() { apiActivities, _ in
                        activities = apiActivities
                    }
                }
                .navigationTitle("每日运动")
                .navigationBarTitleDisplayMode(.inline)
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
            if activity.state == 1 || (activity.state == 4 && !activity.isRegister){
                Button(action: signUp) {
                    Text(activity.isRegister ? "已报名" : "报名")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        .foregroundColor(.white)
                        .background(activity.isRegister ? Color.gray : Color.blue)
                        .clipShape(Capsule())
                        .disabled(activity.isRegister)
                }
            }
            else if activity.state == 4 && activity.isRegister {
                Button(action: sign) {
                    Text("打卡")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        .foregroundColor(.white)
                        .background(Color.blue)
//                        .background(activity.isSign ?? false ? Color.gray : Color.blue)
                        .clipShape(Capsule())
//                        .disabled(activity.isSign ?? false)
                }
            }
        }
    }

    func sign() -> Void {
        API.Activity.sign(userid: UserDefaults.standard.string(forKey: "id") ?? "", activityid: activity.id) { res, _ in
            print("\(res?.code ?? -1) - \(res?.message ?? "res message nil")")
        }
    }

    func signUp() -> Void {
        API.Activity.signUp(activityid: activity.id) { res, _ in
            print(res?.success ?? false ? "success \(res!.reason ?? "")" : "fail \(res?.reason ?? "reason nil")")
        }
    }
}
