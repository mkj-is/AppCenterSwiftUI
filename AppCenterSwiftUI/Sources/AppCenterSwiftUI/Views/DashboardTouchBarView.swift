import Elementary
import SwiftUI

struct DashboardTouchBarView: View {
    let logout, reload: Call

    var body: some View {
        HStack {
            Button(action: logout, label: ^HStack {
                Symbol.logout
                Text("Logout")
            })
            Button(action: reload, label: ^HStack {
                Symbol.reload
                Text("Reload")
            })
        }
    }
}

struct DashboardTouchBarView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTouchBarView(logout: noop, reload: noop)
    }
}
