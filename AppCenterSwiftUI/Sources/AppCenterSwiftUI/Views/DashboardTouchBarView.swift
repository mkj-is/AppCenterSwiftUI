import SwiftUI
import Elementary

struct DashboardTouchBarView: View {
    let logout, reload: Call

    var body: some View {
        HStack {
            Button(action: logout, label: ^Text("􀜗 Logout"))
            Button(action: reload, label: ^Text("􀊯 Reload"))
        }
    }
}

struct DashboardTouchBarView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTouchBarView(logout: {}, reload: {})
    }
}
