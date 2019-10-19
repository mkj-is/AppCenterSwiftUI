import SwiftUI

struct AppListView: View {
    let apps: [App]

    var body: some View {
        List(apps) { app in
            Text(app.id.uuidString)
        }
    }
}
