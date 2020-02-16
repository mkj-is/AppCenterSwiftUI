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
    let user: User
    let downloadingReleases: Set<AppRelease>
    let appSelected: (App) -> Void
    let download: (AppRelease) -> Void
    let logout, reload: Call

    var body: some View {
        #if os(macOS)
            return HSplitView {
                AppListView(apps: apps, selectedApp: selectedApp, releases: releases, downloadingReleases: downloadingReleases, appSelected: appSelected, download: download)
                ReleaseListView(app: selectedApp, releases: selectedApp.flatMap { releases[$0] }, downloadingReleases: downloadingReleases, download: download)
            }.touchBar(content: ^DashboardTouchBarView(logout: self.logout, reload: self.reload))
        #elseif os(iOS)
        return NavigationView {
            AppListView(
                apps: apps,
                selectedApp: selectedApp, releases: releases, downloadingReleases: downloadingReleases,
                appSelected: appSelected, download: download
            )
                .navigationBarTitle("Apps")
                .navigationBarItems(leading: Modal(
                    label: ^Symbol.account,
                    content: { presentation in
                        UserView(user: self.user, logout: {
                            presentation(false)
                            self.logout()
                        })
                }))
            ReleaseListView(app: selectedApp, releases: selectedApp.flatMap { releases[$0] }, downloadingReleases: downloadingReleases, download: download)
            .navigationViewStyle(StackNavigationViewStyle())
        }
        #endif
    }

    private func logout(presentation: (Bool) -> Void) {
        presentation(false)
        logout()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(apps: [], selectedApp: nil, releases: [:], user: User(id: UUID(), avatarUrl: nil, canChangePassword: false, displayName: "Mockup user", email: "user@example.com", name: "mockup.user", origin: "appcenter", permissions: nil), downloadingReleases: [], appSelected: noop, download: noop, logout: noop, reload: noop)
    }
}
