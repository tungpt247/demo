//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class MovieDetailWireFrame: MovieDetailWireFrameProtocol
{
    class func presentMovieDetailModule(fromView view: AnyObject)
    {
        // Generating module components
        let view: MovieDetailViewProtocol = MovieDetailView()
        let presenter: protocol<MovieDetailPresenterProtocol, MovieDetailInteractorOutputProtocol> = MovieDetailPresenter()
        let interactor: MovieDetailInteractorInputProtocol = MovieDetailInteractor()
        let APIDataManager: MovieDetailAPIDataManagerInputProtocol = MovieDetailAPIDataManager()
        let localDataManager: MovieDetailLocalDataManagerInputProtocol = MovieDetailLocalDataManager()
        let wireFrame: MovieDetailWireFrameProtocol = MovieDetailWireFrame()
        
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