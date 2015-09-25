//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import UIKit

protocol GenreListViewProtocol: class
{
    var presenter: GenreListPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol GenreListWireFrameProtocol: class
{
    static func presentGenreListModule(fromView view: UINavigationController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    
    func footerView(fromView view:UIView) -> UIView
    func presentGenre(selectedNewsItem news:GenreListItem, view: UINavigationController, completion: ((completed: Bool) -> ())?)
}

protocol GenreListPresenterProtocol: class
{
    var view: GenreListViewProtocol? { get set }
    var interactor: GenreListInteractorInputProtocol? { get set }
    var wireFrame: GenreListWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    
    func fetchLocalData(completion:(error:NSError?) -> ())
    func numberOfItems() -> Int
    func numberOfSections() -> Int
    func setContentToView(view: GenreListItemViewProtocol, index:Int)
    func genreListItemAtIndexPath(index:Int) -> GenreListItem
    func footerView(fromView view:UIView) -> UIView
    func userDidSelectGenreItem(atIndexPath indexPath: NSIndexPath, controller: UINavigationController, cellView: UITableViewCell)
}

protocol GenreListInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol GenreListInteractorInputProtocol: class
{
    var presenter: GenreListInteractorOutputProtocol? { get set }
    var APIDataManager: GenreListAPIDataManagerInputProtocol? { get set }
    var localDatamanager: GenreListLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    
    func fetchLocalData(completion:(error:NSError?) -> ())
    func numberOfItems() -> Int
    func numberOfSections() -> Int
    func genreListItemAtIndexPath(index:Int) -> GenreListItem
}

protocol GenreListDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol GenreListAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol GenreListLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
    func fetchLocalData(completion:(error:NSError?) -> ())
    func numberOfItems() -> Int
    func numberOfSections() -> Int
    func genreListItemAtIndexPath(index:Int) -> GenreListItem
}

protocol GenreListItemViewProtocol: class {
    func set(name name: String)
    func set(image image: String)
}
