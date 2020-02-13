//
//  AppEffect.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 13/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import Foundation
import Elementary
import ElementaryEffectBuilder

let appEffect: Effect<AppState, AppAction> = buildEffect {
    createNetworkEffect()
    createPersistenceEffect()
}
