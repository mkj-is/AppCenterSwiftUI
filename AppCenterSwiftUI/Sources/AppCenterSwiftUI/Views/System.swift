import SwiftUI

enum OperatingSystem {
    case macOS, iOS, tvOS, watchOS

    static var current: OperatingSystem {
        #if os(macOS)
        return .macOS
        #elseif os(iOS)
        return .iOS
        #elseif os(tvOS)
        return .tvOS
        #elseif os(watchOS)
        return .watchOS
        #else
        #error("Compiling for unknown operating system.")
        #endif
    }
}

struct System<Content: View>: View {
    let operatingSystem: OperatingSystem
    let content: Content

    init(_ operatingSystem: OperatingSystem, @ViewBuilder content: () -> Content) {
        self.operatingSystem = operatingSystem
        self.content = content()
    }

    var body: some View {
        if operatingSystem == .current {
            content
        }
    }
}
