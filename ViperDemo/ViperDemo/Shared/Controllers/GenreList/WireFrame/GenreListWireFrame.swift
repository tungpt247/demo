//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import UIKit

class GenreListWireFrame: GenreListWireFrameProtocol
{
    class func presentGenreListModule(fromView view: UINavigationController)
    {
        // Generating module components
        let genreView: GenreListViewProtocol = GenreListView()
        let presenter: protocol<GenreListPresenterProtocol, GenreListInteractorOutputProtocol> = GenreListPresenter()
        let interactor: GenreListInteractorInputProtocol = GenreListInteractor()
        let APIDataManager: GenreListAPIDataManagerInputProtocol = GenreListAPIDataManager()
        let localDataManager: GenreListLocalDataManagerInputProtocol = GenreListLocalDataManager()
        let wireFrame: GenreListWireFrameProtocol = GenreListWireFrame()
        
        // Connecting
        genreView.presenter = presenter
        presenter.view = genreView
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let scheduleDetailView = storyboard.instantiateViewControllerWithIdentifier("Genre") as? GenreListView
        view.pushViewController(scheduleDetailView!, animated: true)
    }
    
    func presentGenre(selectedNewsItem news: GenreListItem, view: UINavigationController, completion: ((completed: Bool) -> ())?) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
        })
    }
    
    func footerView(fromView view:UIView) -> UIView {
        let view = UIView(frame: CGRectMake(0, 0, view.frame.width, 10))
        view.backgroundColor = .clearColor()
        return view
    }
}