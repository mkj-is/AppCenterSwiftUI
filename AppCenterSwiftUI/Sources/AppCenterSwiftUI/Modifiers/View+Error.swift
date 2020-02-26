import Elementary
import SwiftUI

extension View {
    func error(_ error: Error?, dismiss: @escaping Call, retry: Call?) -> some View {
        self.modifier(ErrorViewModifier(error: error, dismiss: dismiss, retry: retry))
    }
}

private struct IdentifiableError: Identifiable {
    let error: Error

    var id: String {
        error.localizedDescription
    }
}

private struct ErrorViewModifier: ViewModifier {
    let binding: Binding<IdentifiableError?>
    let retry: Call?

    init(error: Error?, dismiss: @escaping Call, retry: Call?) {
        self.retry = retry
        self.binding = Binding(
            get: ^error.flatMap(IdentifiableError.init),
            set: { newValue in
                if newValue == nil {
                    dismiss()
                }
            }
        )
    }

    func body(content: Content) -> some View {
        content.alert(item: binding) { error in
            let title = Text("Error")
            let message = Text(error.error.localizedDescription)

            if let retry = retry {
                return Alert(
                    title: title,
                    message: message,
                    primaryButton: .default(Text("Retry"), action: retry),
                    secondaryButton: .cancel()
                )
            } else {
                return Alert(
                    title: title,
                    message: message
                )
            }
        }
    }
}
