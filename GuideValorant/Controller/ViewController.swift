//
//  ViewController.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 10/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SideMenu

class ViewController: UIViewController, MenuControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    private let charactersController = CharactersViewController()
    private let mapsController = MapsViewController()
    private let settingsController = SettingsController()
    
    var personagens: [ContentList.Characters] = []
    var mapas: [ContentList.Maps] = []
    let repository = ContentRepository()
    
    //TabBar
    let tabBarVC = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let menu = MenuController(with: SideMenuItem.allCases)
//
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        repository.getContent(onSuccess: { content in
            self.charactersController.listChar = content.characters
            self.mapsController.listMaps = content.maps
            self.view.addSubview(self.tabBarVC.view)
            self.addChildControllers()

            
        })
        { error in print("outro erro: \(error)")}
        

        tabBarVC.setViewControllers([charactersController, mapsController], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen

        
    }
    
    private func addChildControllers(){
        
        //        charactersController.valor2 = personagens
        
//        addChild(charactersController)
//        addChild(mapsController)
//
//        view.addSubview(charactersController.view)
//        view.addSubview(mapsController.view)
//
//        charactersController.view.frame = view.bounds
//        mapsController.view.frame = view.bounds
//
//        charactersController.didMove(toParent: self)
//        mapsController.didMove(toParent: self)
//
//        charactersController.view.isHidden = true
//        mapsController.view.isHidden = true
        
        addChild(settingsController)
        view.addSubview(settingsController.view)
        settingsController.view.frame = view.bounds
        settingsController.didMove(toParent: self)
        settingsController.view.isHidden = true
        
    }
    
    @IBAction func didTapMenuButton() {
        present(sideMenu!, animated: true)
    }

    func didSelectMenuItem(named: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: nil)

        title = named.rawValue

        switch named {
        case .settings:
            settingsController.view.isHidden = false
//            charactersController.view.isHidden = true
//            mapsController.view.isHidden = true
        case .home:
            settingsController.view.isHidden = true
//            charactersController.view.isHidden = true
//            mapsController.view.isHidden = true
//        case .characters:
//            settingsController.view.isHidden = true
//            charactersController.view.isHidden = false
//            mapsController.view.isHidden = true
//        case .maps:
//            settingsController.view.isHidden = true
//            charactersController.view.isHidden = true
//            mapsController.view.isHidden = false
            
        }
    }
}
