import SwiftUI

enum Symbol: String, View {
    case appBadge = "app.badge"
    case box = "cube.box.fill"
    case download = "square.and.arrow.down"
    case account = "person.crop.circle"
    case close = "xmark"

    private var symbol: Character {
        switch self {
        case .appBadge:
            return "􀑏"
        case .box:
            return "􀐛"
        case .download:
            return "􀈄"
        case .account:
            return "􀉭"
        case .close:
            return "􀆄"
        }
    }

    var body: some View {
        #if os(iOS)
        return Image(systemName: rawValue)
        #else
        return Text(String(symbol))
        #endif
    }
}
