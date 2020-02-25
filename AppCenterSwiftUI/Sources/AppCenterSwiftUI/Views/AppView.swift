import SwiftUI
import ElementaryCombine

public struct AppView: View {
    @ObservedObject var store: ObservableStore<AppState, AppAction>

    public init() {
        self.store = ObservableStore<AppState, AppAction>(
            state: AppState(),
            update: appUpdate,
            effect: createAppEffect(),
            initialAction: .appStarted
        )
    }

    public var body: some View {
        Group {
            if store.state.user != nil {
                DashboardView(
                    apps: store.state.apps,
                    selectedApp: store.state.selectedApp,
                    releases: store.state.releases,
                    user: store.state.user!,
                    downloadingReleases: store.state.downloadingReleases,
                    appSelected: { self.store.dispatch(.appSelected($0)) },
                    download: { self.store.dispatch(.loadReleaseDetail($0)) },
                    logout: ^self.store.dispatch(.logout),
                    reload: ^self.store.dispatch(.loadApps)
                )
            } else {
                LoginView(
                    isLoading: store.state.user == nil && store.state.auth != nil,
                    authenticate: { self.store.dispatch(.login($0))}
                )
            }
        }
        .error(
            self.store.state.lastError,
            dismiss: ^self.store.dispatch(.dismissError),
            retry: self.store.state.retryableAction != nil ? ^self.store.dispatch(.retry) : nil
        )
        .accentColorIfAvailable(.appPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
