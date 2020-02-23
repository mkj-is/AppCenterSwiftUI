
import Elementary

func createRetryEffect() -> Effect<AppState, AppAction> {
    { state, action, dispatch in
        if action == .retry, let retryableAction = state().retryableAction {
            dispatch(retryableAction.appAction)
            dispatch(.retried)
        }
    }
}
