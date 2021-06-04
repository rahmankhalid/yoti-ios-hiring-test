//
// Copyright © 2021 Yoti Ltd. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var appFlowCoordinator  : AppFlowCoordinator?
    var window              : UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene       = (scene as? UIWindowScene) else { return }
        let navigationController    = UINavigationController()
        
        window                      = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene         = windowScene
        window?.rootViewController  = navigationController
        
        appFlowCoordinator = AppFlowCoordinator(navigationController: navigationController)
        appFlowCoordinator?.start()
        
        window?.makeKeyAndVisible()
    }
}
