import NoopKit
import SwiftUI

struct ReleaseListView: View {
    let app: App?
    let releases: [Release]?
    let downloadingReleases: Set<AppRelease>
    let download: (AppRelease) -> Void

    var body: some View {
        Group {
            if releases == nil {
                LoadingView()
            } else {
                List(releases ?? []) { release in
                    VStack(alignment: .center, spacing: .smallPadding) {
                        HStack(alignment: .center, spacing: .smallPadding) {
                            Symbol.box
                                .frame(width: 30, height: 30)
                                .font(.title)
                            VStack(alignment: .leading) {
                                Text("\(release.shortVersion) (\(release.version))")
                                Text(release.uploadedAt.flatMap(DateFormatter.standard.string) ?? "Empty date")
                                    .foregroundColor(Color.gray)
                            }.padding(.horizontal, .standardPadding)
                            Spacer()
                            if !self.downloadingReleases.filter({ $0.app == self.app && $0.release == release }).isEmpty {
                                LoadingView()
                            } else {
                                Button(action: ^self.download(release: release), label: self.downloadSymbol)
                            }
                        }
                        System(.macOS, content: Divider.init)
                    }
                }
            }
        }.navigationBarTitleIfAvailable("Releases")
    }

    private func downloadSymbol() -> some View {
        Symbol.download
            .foregroundColor(.appPrimary)
            .frame(width: 30, height: 30)
            .fixedSize()
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
        ReleaseListView(app: nil, releases: (0 as UInt...30).map { index in
            Release(origin: .appcenter, id: index, shortVersion: "\(index)", version: "1.0.0", uploadedAt: Date(), enabled: true, destinations: nil, build: nil)
        }, downloadingReleases: [], download: noop)
    }
}
