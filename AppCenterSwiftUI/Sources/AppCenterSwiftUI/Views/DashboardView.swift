//
//  DashboardView.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 20/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    let apps: [App]
    let selectedApp: App?
    let releases: [Release]?
    let appSelected: (App) -> Void

    var body: some View {
        #if os(OSX)
            return HSplitView {
                AppListView(apps: apps, selectedApp: selectedApp, appSelected: appSelected)
                ReleaseListView(releases: releases)
            }
        #else
            return AppListView(apps: apps, selectedApp: selectedApp, appSelected: appSelected)
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
        #endif
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(apps: [], selectedApp: nil, releases: nil, appSelected: { print($0) })
    }
}
