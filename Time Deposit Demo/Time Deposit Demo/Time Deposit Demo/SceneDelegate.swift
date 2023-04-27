//
//  SceneDelegate.swift
//  Time Deposit Demo
//
//  Created by Damon Ng on 20/9/22.
//

import TimeDeposit
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        let viewModelSGD = EarlyWithdrawalFormViewModel()
        viewModelSGD.productName = "SGD Time Deposit"
        viewModelSGD.accountNo = "601-808280-501"
        viewModelSGD.accountType = .TimeDeposit
        viewModelSGD.currencyType = .SGD
        viewModelSGD.timeDepositNo = 1
        viewModelSGD.transactedAcct = "9011001709"
        viewModelSGD.transactedAcctType = .TimeDeposit
        
        let viewModelFCY = EarlyWithdrawalFormViewModel()
        viewModelFCY.productName = "Foreign Currency Time Deposit"
        viewModelFCY.accountNo = "601-808280-501"
        viewModelFCY.accountType = .TimeDeposit
        viewModelFCY.currencyType = .USD
        viewModelFCY.timeDepositNo = 1
        viewModelFCY.transactedAcct = "567123456002"
        viewModelFCY.transactedAcctType = .TimeDeposit
        let viewModelTD = PlacementEntryViewModel(placementService:PlacementService(),tdType: TDType.LCY)
        window?.rootViewController = UINavigationController(rootViewController: PlacementEntryViewController(viewModel: viewModelTD))
        //window?.rootViewController = UINavigationController(rootViewController: EarlyWithdrawalFormViewController(viewModel: viewModelFCY))
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

