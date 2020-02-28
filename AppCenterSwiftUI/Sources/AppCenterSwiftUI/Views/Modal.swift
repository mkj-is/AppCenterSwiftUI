import SwiftUI

struct Modal<L: View, C: View>: View {
    @State private var isPresented: Bool = false

    let label: () -> L
    let content: (@escaping () -> Void) -> C

    init(
        @ViewBuilder label: @escaping () -> L,
        @ViewBuilder content: @escaping (@escaping () -> Void) -> C
    ) {
        self.label = label
        self.content = content
    }

    var body: some View {
        Button(action: { self.isPresented = true }, label: self.label)
            .sheet(
                isPresented: $isPresented,
                content: ^self.content({ self.isPresented = false }))
    }
}
