//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class MovieListWireFrame: MovieListWireFrameProtocol
{
    class func presentMovieListModule(fromView view: AnyObject)
    {
        // Generating module components
        var view: MovieListViewProtocol = MovieListView()
        var presenter: protocol<MovieListPresenterProtocol, MovieListInteractorOutputProtocol> = MovieListPresenter()
        var interactor: MovieListInteractorInputProtocol = MovieListInteractor()
        var APIDataManager: MovieListAPIDataManagerInputProtocol = MovieListAPIDataManager()
        var localDataManager: MovieListLocalDataManagerInputProtocol = MovieListLocalDataManager()
        var wireFrame: MovieListWireFrameProtocol = MovieListWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
    }
}