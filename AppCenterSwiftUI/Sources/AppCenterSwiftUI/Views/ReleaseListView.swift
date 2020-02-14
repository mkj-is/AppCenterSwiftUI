//
//  ReleaseListView.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 20/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI

struct ReleaseListView: View {
    let releases: [Release]?
    let download: (Release) -> Void

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
                            Text(DateFormatter.standard.string(from: release.uploadedAt))
                            Button(action: ^self.download(release), label: ^Text("􀈄"))
                        }
                        Divider()
                    }
                }
            }
        }.frame(minWidth: 300, idealWidth: 400)
    }
}

struct ReleaseListView_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseListView(releases: (0 as UInt...30).map { i in
            Release(origin: .appcenter, id: i, shortVersion: "\(i)", version: "1.0.0", uploadedAt: Date(), enabled: true, destinations: nil, build: nil)
        }, download: { print("download", $0) })
    }
}
