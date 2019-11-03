import SwiftUI
import Combine
import Elementary

final class ObservableStore<State, Action>: ObservableObject {

    var objectWillChange: PassthroughSubject<State, Never>
    var state: State { baseStore.state }

    private let baseStore: Store<State, Action>

    public init(
        state: State,
        update: @escaping Update<State, Action>,
        effect: Effect<State, Action>? = nil,
        initialAction: Action? = nil
    ) {
        let passthroughSubject = PassthroughSubject<State, Never>()
        let passthroughEffect: Effect<State, Action> = { state, _, _ in
            passthroughSubject.send(state())
        }

        let combinedEffect = effect.flatMap { combine(effects: $0, passthroughEffect) } ?? passthroughEffect

        self.objectWillChange = passthroughSubject
        self.baseStore = Store<State, Action>(
            state: state,
            update: update,
            effect: combinedEffect,
            initialAction: initialAction
        )
    }

    public func dispatch(_ action: Action) {
        baseStore.dispatch(action)
    }
}
