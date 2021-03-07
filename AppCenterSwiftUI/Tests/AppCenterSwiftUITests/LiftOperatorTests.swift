@testable import AppCenterSwiftUI
import XCTest
import SwiftUI

@available(macOS 11.0, *)
private struct ClosureView: View {
    var body: some View {
        Group {
            ZStack {
                Button {} label: {
                    Label {
                        Text("Button")
                    } icon: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}


@available(macOS 11.0, *)
private struct LiftView: View {
    var body: some View {
        Group(content: ^ZStack(content: ^Button(action: ^(), label: ^Label(title: ^Text("Button"), icon: ^Image(systemName: "xmark")))))
    }
}

@available(macOS 11.0, *)
final class LiftOperatorTests: XCTestCase {
    func testClosurePerformance() {
        let view = ClosureView()
        measure(metrics: [XCTCPUMetric(), XCTMemoryMetric()]) {
            for _ in 0..<1_000_000 {
                _ = view.body
            }
        }
    }
    
    func testOperatorPerformance() {
        let view = LiftView()
        measure(metrics: [XCTCPUMetric(), XCTMemoryMetric()]) {
            for _ in 0..<1_000_000 {
                _ = view.body
            }
        }
    }
}
