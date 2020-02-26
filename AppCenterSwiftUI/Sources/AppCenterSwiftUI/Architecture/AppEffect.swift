import Elementary
import ElementaryEffectBuilder
import Foundation

func createAppEffect() -> Effect<AppState, AppAction> {
    buildEffect {
        createNetworkEffect()
        createPersistenceEffect()
        createUrlEffect()
        createRetryEffect()
    }
}
