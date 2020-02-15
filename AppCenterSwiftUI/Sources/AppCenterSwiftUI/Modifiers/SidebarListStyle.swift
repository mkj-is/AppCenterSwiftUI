import SwiftUI

extension View {
    func sidebarListStyleIfAvailable() -> some View {
        #if os(macOS)
        return listStyle(SidebarListStyle())
        #else
        return self
        #endif
    }
}
