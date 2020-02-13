import Elementary
import SwiftUI

struct ErrorView: View {
    let message: String
    let retry: Call?

    var body: some View {
        VStack {
            Text("􀇿")
                .font(.headline)
                .foregroundColor(.orange)
            Text(message)
                .scaledToFill()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Test error message", retry: nil)
    }
}
