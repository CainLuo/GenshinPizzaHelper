//
//  ReviewHandler.swift
//  GenshinPizzaHepler
//
//  Created by Bill Haku on 2022/8/13.
//

import Foundation
import StoreKit
import SwiftUI

class ReviewHandler {

    static func requestReview() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}
