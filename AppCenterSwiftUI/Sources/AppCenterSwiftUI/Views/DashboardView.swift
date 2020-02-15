//
//  DashboardView.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 20/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI
import Elementary

struct DashboardView: View {

    let apps: [App]
    let selectedApp: App?
    let releases: [App: [Release]]
    let downloadingReleases: Set<AppRelease>
    let appSelected: (App) -> Void
    let download: (AppRelease) -> Void
    let logout, reload: Call

    var body: some View {
        #if os(macOS)
            return HSplitView {
                AppListView(apps: apps, selectedApp: selectedApp, appSelected: appSelected)
                ReleaseListView(app: selectedApp, releases: releases, downloadingReleases: downloadingReleases, download: download)
            }.touchBar(content: ^DashboardTouchBarView(logout: self.logout, reload: self.reload))
        #elseif os(iOS)
        return NavigationView {
            AppListView(
                apps: apps,
                selectedApp: selectedApp, releases: releases, downloadingReleases: downloadingReleases,
                appSelected: appSelected, download: download
            )
                .navigationBarTitle("Apps")
            NavigationView {
                ReleaseListView(app: selectedApp, releases: selectedApp.flatMap { releases[$0] }, downloadingReleases: downloadingReleases, download: download)
            }.navigationViewStyle(StackNavigationViewStyle())
        }
        #endif
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(apps: [], selectedApp: nil, releases: [:], downloadingReleases: [], appSelected: noop, download: noop, logout: noop, reload: noop)
    }
}
