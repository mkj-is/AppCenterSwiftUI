import SwiftUI
import Elementary

extension View {
    func error(_ error: Error?, dismiss: @escaping Call) -> some View {
        self.modifier(ErrorViewModifier(error: error, dismiss: dismiss))
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

    init(error: Error?, dismiss: @escaping Call) {
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
            Alert(
                title: Text("Error"),
                message: Text(error.error.localizedDescription),
                dismissButton: .cancel()
            )
        }
    }
}
