//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

class DiscoverView: UIViewController, DiscoverViewProtocol
{
    var presenter: DiscoverPresenterProtocol? = DiscoverPresenter()
    var currentController:UIViewController?
    var selectIndex:Int?
    
    @IBOutlet var contentView:UIView?
    
    override func viewDidLoad() {
        self.setDefaults()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func setDefaults() {
        
        self.tabBarItem.selectedImage = UIImage(named: "icon-discover-on")
        loadCurrentPositionViewController()
        
    }
    
    func loadCurrentPositionViewController() {
        if currentController == nil {
            selectIndex = 0
            presenter?.presentIntialView(fromView: self, toView: contentView!)
        }
        else { presentView() }
    }
    
    func switchViews(index:Int) {
        if selectIndex != index {
            selectIndex = index
            presentView()
        }
    }
    
    func presentView() {
        if selectIndex == 0 { presenter?.transitionToGenres(fromView: self) }
        if selectIndex == 1 { presenter?.transitionToInTheaters(fromView: self) }
        if selectIndex == 2 { presenter?.transitionToUpcoming(fromView: self) }
    }
}