import SwiftUI

extension View {
    func sidebarListStyleIfAvailable() -> some View {
        #if os(macOS)
        return listStyle(SidebarListStyle())
        #else
        return self
        #endif
    }

    func navigationBarTitleIfAvailable(_ key: LocalizedStringKey) -> some View {
        #if os(macOS) || os(tvOS)
        return self
        #else
        return navigationBarTitle(key, displayMode: .inline)
        #endif
    }

    func accentColorIfAvailable(_ color: Color) -> some View {
        #if os(macOS)
        return self
        #else
        return accentColor(color)
        #endif
    }

    func backgroundColorIfAvailable() -> some View {
        #if os(iOS)
        return background(Color(UIColor.secondarySystemBackground))
        #else
        return self
        #endif
    }
}
