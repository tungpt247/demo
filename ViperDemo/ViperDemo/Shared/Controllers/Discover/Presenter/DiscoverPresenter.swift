//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import UIKit

class DiscoverPresenter: DiscoverPresenterProtocol, DiscoverInteractorOutputProtocol
{
    weak var view: DiscoverViewProtocol?
    var interactor: DiscoverInteractorInputProtocol?
    var wireFrame: DiscoverWireFrameProtocol? = DiscoverWireFrame()
    
    init() {}
    
    func showGenres() -> UITableViewController? {
        return wireFrame?.showGenres()
    }
    
    func showInTheaters() -> UICollectionViewController? {
        return wireFrame?.showInTheaters()
    }
    
    func showUpcoming() -> UICollectionViewController? {
        return wireFrame?.showUpcoming()
    }
    
    func presentIntialView(fromView view: UIViewController, toView contentView: UIView) {
        return wireFrame!.presentIntialView(fromView: view, toView: contentView)
    }
    
    func transitionToGenres(fromView view: UIViewController) {
        return wireFrame!.transitionToGenres(fromView: view)
    }
    
    func transitionToInTheaters(fromView view: UIViewController) {
        return wireFrame!.transitionToInTheaters(fromView: view)
    }
    
    func transitionToUpcoming(fromView view: UIViewController) {
        return wireFrame!.transitionToUpcoming(fromView: view)
    }
    

}