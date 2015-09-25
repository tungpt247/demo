//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import UIKit

class DiscoverWireFrame: DiscoverWireFrameProtocol
{
    let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    var currentViewController:UIViewController?
    
    class func presentDiscoverModule(fromView view: UINavigationController)
    {
        // Generating module components
        let discoverView: DiscoverViewProtocol = DiscoverView()
        let presenter: protocol<DiscoverPresenterProtocol, DiscoverInteractorOutputProtocol> = DiscoverPresenter()
        let interactor: DiscoverInteractorInputProtocol = DiscoverInteractor()
        let APIDataManager: DiscoverAPIDataManagerInputProtocol = DiscoverAPIDataManager()
        let localDataManager: DiscoverLocalDataManagerInputProtocol = DiscoverLocalDataManager()
        let wireFrame: DiscoverWireFrameProtocol = DiscoverWireFrame()
        
        // Connecting
        discoverView.presenter = presenter
        presenter.view = discoverView
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let discoverViewController = storyboard.instantiateViewControllerWithIdentifier("Discover") as? DiscoverView
        view.pushViewController(discoverViewController!, animated: true)
    }

    func presentIntialView(fromView view: UIViewController, toView contentView: UIView) {
        let vc = showGenres()
        currentViewController = vc
        view.addChildViewController(vc!)
        vc!.view.frame = CGRectMake(0, 0, CGFloat(contentView.frame.width), CGFloat(contentView.frame.height))
        contentView.addSubview(vc!.view)
        vc!.didMoveToParentViewController(view)
    }
    
    func transitionToGenres(fromView view: UIViewController) {
        let vc = showGenres()
        
        currentViewController!.willMoveToParentViewController(nil)
        view.addChildViewController(vc!)
        vc!.view.frame = currentViewController!.view.frame
        
        view.transitionFromViewController(currentViewController!, toViewController: vc!, duration: 0.25, options: .TransitionCrossDissolve, animations:{ () -> Void in
            }, completion: { (finished) -> Void in
                self.currentViewController!.removeFromParentViewController()
                vc!.didMoveToParentViewController(view)
                self.currentViewController = vc
        })
    }
    
    func transitionToInTheaters(fromView view: UIViewController) {
        let vc = showInTheaters()
        
        currentViewController!.willMoveToParentViewController(nil)
        view.addChildViewController(vc!)
        vc!.view.frame = currentViewController!.view.frame
        
        view.transitionFromViewController(currentViewController!, toViewController: vc!, duration: 0.25, options: .TransitionCrossDissolve, animations:{ () -> Void in
            }, completion: { (finished) -> Void in
                self.currentViewController!.removeFromParentViewController()
                vc!.didMoveToParentViewController(view)
                self.currentViewController = vc
        })
    }
    
    func transitionToUpcoming(fromView view: UIViewController) {
        let vc = showUpcoming()
        
        currentViewController!.willMoveToParentViewController(nil)
        view.addChildViewController(vc!)
        vc!.view.frame = currentViewController!.view.frame
        
        view.transitionFromViewController(currentViewController!, toViewController: vc!, duration: 0.25, options: .TransitionCrossDissolve, animations:{ () -> Void in
            }, completion: { (finished) -> Void in
                self.currentViewController!.removeFromParentViewController()
                vc!.didMoveToParentViewController(view)
                self.currentViewController = vc
        })
    }
    
    func showGenres() -> UITableViewController? {
        return storyboard.instantiateViewControllerWithIdentifier("Genre") as? UITableViewController
    }
    
    func showInTheaters() -> UICollectionViewController? {
        return storyboard.instantiateViewControllerWithIdentifier("InTheaters") as? UICollectionViewController
    }
    
    func showUpcoming() -> UICollectionViewController? {
        return storyboard.instantiateViewControllerWithIdentifier("Upcoming") as? UICollectionViewController
    }
}