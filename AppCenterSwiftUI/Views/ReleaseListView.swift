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

    var body: some View {
        ZStack {
            if releases == nil {
                LoadingView()
            } else {
                List(releases ?? []) { release in
                    HStack {
                        Text("􀐛")
                            .font(.title)
                            .foregroundColor(.appPrimary)
                        Text("\(release.id)")
                        Text(release.shortVersion)
                        Text(release.version)
                    }
                }
            }
        }.frame(minWidth: 300, idealWidth: 400)
    }
}

struct ReleaseListView_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseListView(releases: nil)
    }
}
