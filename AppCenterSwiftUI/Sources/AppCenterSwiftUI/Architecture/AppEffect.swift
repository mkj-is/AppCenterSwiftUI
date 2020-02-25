import Foundation
import Elementary
import ElementaryEffectBuilder

func createAppEffect() -> Effect<AppState, AppAction> {
    buildEffect {
        createNetworkEffect()
        createPersistenceEffect()
        createUrlEffect()
        createRetryEffect()
    }
}
