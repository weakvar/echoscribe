//
//  SubscriptionsPresenter.swift
//  Echoscribe
//
//  Created by Vladislav Len on 04.12.2021.
//

import UIKit

protocol SubscriptionsPresenterProtocol {
    var subscriptions: [Subscription] { get set }
    init(view: SubscriptionsViewProtocol, router: SubscriptionsRouterProtocol)
}

final class SubscriptionsPresenter: SubscriptionsPresenterProtocol {
    
    // MARK: - Private Properties
    
    private weak var view: SubscriptionsViewProtocol?
    private let router: SubscriptionsRouterProtocol
    
    lazy var subscriptions: [Subscription] = {
        return [
            Subscription(service: SubscriptionService(name: "Spotify", logoUrl: "https://echoscribe.s3.eu-central-1.amazonaws.com/images/spotify.png"), paymentDate: Date()),
            Subscription(service: SubscriptionService(name: "Яндекс.Музыка", logoUrl: "https://echoscribe.s3.eu-central-1.amazonaws.com/images/yandex_music.png"), paymentDate: Date()),
            Subscription(service: SubscriptionService(name: "Apple Music", logoUrl: "https://echoscribe.s3.eu-central-1.amazonaws.com/images/apple_music.png"), paymentDate: Date())
        ]
    }()
    
    // MARK: - Initializers
    
    init(view: SubscriptionsViewProtocol, router: SubscriptionsRouterProtocol) {
        self.view = view
        self.router = router
    }
    
}
