import SwiftUI

enum Symbol: String, View {
    case appBadge = "app.badge"
    case box = "cube.box.fill"
    case download = "square.and.arrow.down"
    case account = "person.crop.circle"
    case close = "xmark"
    case reload = "arrow.2.circlepath"
    case logout = "person.badge.minus"

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
        case .reload:
            return "􀊯"
        case .logout:
            return "􀜗"
        }
    }

    var body: some View {
        #if os(macOS)
        return Text(String(symbol))
        #else
        return Image(systemName: rawValue)
            .resizable()
            .aspectRatio(contentMode: .fit)
        #endif
    }
}
