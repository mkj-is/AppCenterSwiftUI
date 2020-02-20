import SwiftUI

extension View {
    func alert(error: Error?) -> some View {
        AlertErrorView(error: error, content: self)
    }
}

private struct AlertErrorView<C: View>: View {
    @State private var presented: Bool = false
    @State private var error: Error?
    private let content: C

    init(error: Error?, content: C) {
        self.content = content
        self.error = error

        if error != nil, presented == false {
            presented = true
        }
    }

    var body: some View {
        content.alert(isPresented: $presented) {
            Alert(title: Text("Error"), message: (error?.localizedDescription).flatMap(Text.init), dismissButton: .default(Text("Dismiss"), action: {
                self.error = nil
            }))
        }
    }
}
