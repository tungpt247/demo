//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import UIKit

protocol HomeViewProtocol: class
{
    var presenter: HomePresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol HomeWireFrameProtocol: class
{
    static func presentHomeModule(fromView view: UINavigationController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func presentDiscover(selectedNewsItem news:HomeItem, view: UINavigationController, completion: ((completed: Bool) -> ())?)
}

protocol HomePresenterProtocol: class
{
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    
    func fetchLocalData(completion:(error:NSError?) -> ())
    func numberOfItems(inSection section:Int) -> Int
    func numberOfSections() -> Int
    func setContentToView(view: HomeItemViewProtocol, index:NSIndexPath)
    func homeItemAtIndexPath(index:NSIndexPath) -> HomeItem
    func userDidSelectHomeItem(atIndexPath indexPath: NSIndexPath, controller: UINavigationController, cellView: UITableViewCell)
}

protocol HomeInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol HomeInteractorInputProtocol: class
{
    var presenter: HomeInteractorOutputProtocol? { get set }
    var APIDataManager: HomeAPIDataManagerInputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    
    func fetchLocalData(completion:(error:NSError?) -> ())
    func numberOfItems(inSection section:Int) -> Int
    func numberOfSections() -> Int
    func homeItemAtIndexPath(index:NSIndexPath) -> HomeItem
}

protocol HomeDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
    
    
}

protocol HomeAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol HomeLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
    
    func fetchLocalData(completion:(error:NSError?) -> ())
    func numberOfItems(inSection section:Int) -> Int
    func numberOfSections() -> Int
    func homeItemAtIndexPath(index:NSIndexPath) -> HomeItem
}

protocol HomeItemViewProtocol: class {
    func set(name name: String)
    func set(image image: String)
}
