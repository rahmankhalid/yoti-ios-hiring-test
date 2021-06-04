//
// Copyright © 2021 Yoti Ltd. All rights reserved.
//


import UIKit.UINavigationController

final class AppFlowCoordinator {
    
    private weak var navigationController   : UINavigationController?
    private let diContainer                 = DIContainer()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController!.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        toCountriesAndCapital()
    }
    
    func toCountriesAndCapital() {
        navigationController?.pushViewController(diContainer.makeCountriesViewController(), animated: true)
    }
    
}
