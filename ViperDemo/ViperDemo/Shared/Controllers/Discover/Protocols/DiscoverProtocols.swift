//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import UIKit

protocol DiscoverViewProtocol: class
{
    var presenter: DiscoverPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol DiscoverWireFrameProtocol: class
{
    static func presentDiscoverModule(fromView view: UINavigationController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func showGenres() -> UITableViewController?
    func showInTheaters() -> UICollectionViewController?
    func showUpcoming() -> UICollectionViewController?
    func presentIntialView(fromView view: UIViewController, toView contentView: UIView)
    func transitionToGenres(fromView view: UIViewController)
    func transitionToInTheaters(fromView view: UIViewController)
    func transitionToUpcoming(fromView view: UIViewController)
}

protocol DiscoverPresenterProtocol: class
{
    var view: DiscoverViewProtocol? { get set }
    var interactor: DiscoverInteractorInputProtocol? { get set }
    var wireFrame: DiscoverWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    
    func showGenres() -> UITableViewController?
    func showInTheaters() -> UICollectionViewController?
    func showUpcoming() -> UICollectionViewController?
    func presentIntialView(fromView view: UIViewController, toView contentView: UIView)
    
    func transitionToGenres(fromView view: UIViewController)
    func transitionToInTheaters(fromView view: UIViewController)
    func transitionToUpcoming(fromView view: UIViewController)
}

protocol DiscoverInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    

}

protocol DiscoverInteractorInputProtocol: class
{
    var presenter: DiscoverInteractorOutputProtocol? { get set }
    var APIDataManager: DiscoverAPIDataManagerInputProtocol? { get set }
    var localDatamanager: DiscoverLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol DiscoverDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol DiscoverAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol DiscoverLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
