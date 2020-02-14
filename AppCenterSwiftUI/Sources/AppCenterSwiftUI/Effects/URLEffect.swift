import Elementary
import ElementaryEffectBuilder

#if os(macOS)
import AppKit
#else
import UIKit
#endif

func createUrlEffect() -> Effect<AppState, AppAction> {
    { _, action, _ in
        if case .open(let url) = action {
            #if os(macOS)
            NSWorkspace.shared.open(url)
            #else
            UIApplication.shared.open(url)
            #endif
        }
    }
}
