import Elementary
import ElementaryEffectBuilder

#if os(macOS)
import AppKit
#else
import UIKit
#endif

private func open(url: URL) {
    #if os(macOS)
    NSWorkspace.shared.open(url)
    #else
    UIApplication.shared.open(url)
    #endif
}

func createUrlEffect() -> Effect<AppState, AppAction> {
    { _, action, _ in
        switch action {
        case .open(let url):
            open(url: url)
        case .select(.token):
            open(url: "https://appcenter.ms/cli-login?hostname=AppCenterSwiftUI")
        default:
            break
        }
    }
}
