//
//  ReleaseListView.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 20/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI

struct ReleaseListView: View {
    let app: App?
    let releases: [Release]?
    let downloadingReleases: Set<AppRelease>
    let download: (AppRelease) -> Void

    var body: some View {
        ZStack {
            if releases == nil {
                LoadingView()
            } else {
                List(releases ?? []) { release in
                    VStack(alignment: .center, spacing: .smallPadding) {
                        HStack(alignment: .center, spacing: .smallPadding) {
                            Text("􀐛")
                                .font(.title)
                                .foregroundColor(.appPrimary)
                            Text("\(release.id)")
                            Spacer()
                            Text(release.version)
                            Spacer()
                            Text(release.shortVersion)
                            Spacer()
                            Text(release.uploadedAt.flatMap(DateFormatter.standard.string) ?? "Empty date")
                            if !self.downloadingReleases.filter({ $0.app == self.app && $0.release == release }).isEmpty {
                                LoadingView()
                            } else {
                                Button(action: ^self.download(release: release), label: ^Text("􀈄"))
                            }
                        }
                        Divider()
                    }
                }
            }
        }.frame(minWidth: 300, idealWidth: 400)
    }

    private func download(release: Release) {
        guard let app = app else {
            return
        }
        download(AppRelease(app: app, release: release))
    }
}

struct ReleaseListView_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseListView(app: nil, releases: (0 as UInt...30).map { i in
            Release(origin: .appcenter, id: i, shortVersion: "\(i)", version: "1.0.0", uploadedAt: Date(), enabled: true, destinations: nil, build: nil)
        }, downloadingReleases: [], download: { print("download", $0) })
    }
}
