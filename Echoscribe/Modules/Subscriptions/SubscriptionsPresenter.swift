//
//  SubscriptionsPresenter.swift
//  Echoscribe
//
//  Created by Vladislav Len on 04.12.2021.
//

import UIKit

protocol SubscriptionsPresenterProtocol {
    init(view: SubscriptionsViewProtocol, router: SubscriptionsRouterProtocol)
}

final class SubscriptionsPresenter: SubscriptionsPresenterProtocol {
    
    // MARK: - Private Properties
    
    private weak var view: SubscriptionsViewProtocol?
    private let router: SubscriptionsRouterProtocol
    
    // MARK: - Initializers
    
    init(view: SubscriptionsViewProtocol, router: SubscriptionsRouterProtocol) {
        self.view = view
        self.router = router
    }
    
}
