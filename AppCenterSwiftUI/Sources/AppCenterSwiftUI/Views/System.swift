import SwiftUI

enum OperatingSystem {
    case macOS
    case iOS
}

struct System<Content: View>: View {
    let operatingSystem: OperatingSystem
    let content: () -> Content

    init(_ operatingSystem: OperatingSystem, @ViewBuilder content: @escaping () -> Content) {
        self.operatingSystem = operatingSystem
        self.content = content
    }

    var body: some View {
        Group {
            #if os(macOS)
            if operatingSystem == .macOS {
                content()
            } else {
                EmptyView()
            }
            #elseif os(iOS)
            if operatingSystem == .iOS {
                content()
            } else {
                EmptyView()
            }
            #endif
        }
    }
}
