import SwiftUI

struct OperatingSystem: OptionSet {
    let rawValue: UInt8
    
    static let macOS = OperatingSystem(rawValue: 1 << 0)
    static let iOS = OperatingSystem(rawValue: 1 << 1)
    static let tvOS = OperatingSystem(rawValue: 1 << 2)
    static let watchOS = OperatingSystem(rawValue: 1 << 3)
    
    var isCurrent: Bool {
        #if os(macOS)
        return contains(.macOS)
        #elseif os(iOS)
        return contains(.iOS)
        #elseif os(tvOS)
        return contains(.tvOS)
        #elseif os(watchOS)
        return contains(.watchOS)
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
        if operatingSystem.isCurrent {
            content
        }
    }
}
