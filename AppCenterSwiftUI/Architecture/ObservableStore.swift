import SwiftUI
import Combine
import Elementary

final class ObservableStore<State, Action>: ObservableObject {

    private let store: Store<State, Action>
    let objectWillChange: PassthroughSubject<State, Never>

    init(state: State, update: @escaping Update<State, Action>, effect: @escaping Effect<State, Action>) {
        let subject = PassthroughSubject<State, Never>()

        self.store = Store(state: state, update: update) { state, action, dispatch in
            subject.send(state())
            effect(state, action, dispatch)
        }
        self.objectWillChange = subject
    }

    func dispatch(_ action: Action) {
        store.dispatch(action)
    }
}
