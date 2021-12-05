//
//  SubscriptionsRouter.swift
//  Echoscribe
//
//  Created by Vladislav Len on 04.12.2021.
//

import UIKit

protocol SubscriptionsRouterProtocol {
    init(view: UIViewController)
}

final class SubscriptionsRouter: SubscriptionsRouterProtocol {
    
    // MARK: - Private Properties
    
    private weak var view: UIViewController?
    
    // MARK: - Initializers
    
    init(view: UIViewController) {
        self.view = view
    }
    
}
