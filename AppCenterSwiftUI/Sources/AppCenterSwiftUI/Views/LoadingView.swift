import SwiftUI

struct LoadingView: View {
    var body: some View {
        #if os(iOS)
        return ActivityIndicator()
        #else
        return Text("Loading…").scaledToFill()
        #endif
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
