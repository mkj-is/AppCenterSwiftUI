//
//  StringPasteButton.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 14/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI

private struct PasteButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Text("􀉄")
    }
}

struct StringPasteButton: View {
    let paste: (String) -> Void

    var body: some View {
        #if os(macOS)
            return PasteButton(supportedTypes: [kUTTypeUTF8PlainText as String], payloadAction: payloadAction)
                .buttonStyle(PasteButtonStyle())
        #else
            return EmptyView()
        #endif
    }

    #if os(macOS)
    private func payloadAction(providers: [NSItemProvider]) {
        providers.forEach { provider in
            provider.loadItem(forTypeIdentifier: kUTTypeUTF8PlainText as String, options: nil) { (coding, _) in
                if let data = coding as? Data, let string = String(data: data, encoding: .utf8) {
                    self.paste(string)
                }
            }
        }
    }
    #endif
}

struct StringPasteButton_Previews: PreviewProvider {
    static var previews: some View {
        StringPasteButton(paste: { print($0) })
    }
}
