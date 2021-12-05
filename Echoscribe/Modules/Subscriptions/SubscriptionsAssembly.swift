//
//  SubscriptionsAssembly.swift
//  Echoscribe
//
//  Created by Vladislav Len on 04.12.2021.
//

import UIKit

final class SubscriptionsAssembly {
    
    static func assembly() -> SubscriptionsViewController {
        let view = SubscriptionsViewController()
        let router = SubscriptionsRouter(view: view)
        let presenter = SubscriptionsPresenter(view: view, router: router)
        view.presenter = presenter
        
        return view
    }
    
}
