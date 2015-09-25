//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import UIKit

class HomeWireFrame: HomeWireFrameProtocol
{
    class func presentHomeModule(fromView view: UINavigationController)
    {
        // Generating module components
        let view: HomeViewProtocol = HomeView()
        let presenter: protocol<HomePresenterProtocol, HomeInteractorOutputProtocol> = HomePresenter()
        let interactor: HomeInteractorInputProtocol = HomeInteractor()
        let APIDataManager: HomeAPIDataManagerInputProtocol = HomeAPIDataManager()
        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
        let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        
    }
    
    func presentDiscover(selectedNewsItem news: HomeItem, view: UINavigationController, completion: ((completed: Bool) -> ())?) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            DiscoverWireFrame.presentDiscoverModule(fromView: view)
        })
    }
}