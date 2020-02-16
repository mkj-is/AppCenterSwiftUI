import SwiftUI

extension View {
    func navigationBarTitleIfAvailable(_ key: LocalizedStringKey) -> some View {
        #if os(macOS)
        return self
        #else
        return navigationBarTitle(key, displayMode: .inline)
        #endif
    }
}

