import SwiftUI

struct AppDisclosureView: View {
    let app: App

    var body: some View {
        HStack(alignment: .center, spacing: .standardSpacing) {
            WebImage(placeholder: Color.gray, url: app.iconUrl)
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            Text(app.displayName)
            Spacer()
            Text(app.os.rawValue)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: .smallPadding, bottom: 0, trailing: .smallPadding))
                .background(Capsule().foregroundColor(.secondary))
        }.padding(0)
    }
}
