#if os(iOS)
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    enum Style {
        case large, medium
    }

    let style: Style
    let isAnimating: Bool

    init(style: Style = .medium, isAnimating: Bool = true) {
        self.style = style
        self.isAnimating = isAnimating
    }

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        update(view: view)
        return view
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        update(view: uiView)
    }

    private func update(view: UIActivityIndicatorView) {
        switch style {
        case .large:
            view.style = .large
        case .medium:
            view.style = .medium
        }
        guard view.isAnimating != isAnimating else {
            return
        }

        if isAnimating {
            view.startAnimating()
        } else {
            view.stopAnimating()
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActivityIndicator()
            ActivityIndicator(style: .large)
            ActivityIndicator().environment(\.colorScheme, .dark)
        }
    }
}
#endif
