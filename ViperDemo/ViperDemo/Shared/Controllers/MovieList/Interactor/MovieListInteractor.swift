//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class MovieListInteractor: MovieListInteractorInputProtocol
{
    weak var presenter: MovieListInteractorOutputProtocol?
    var APIDataManager: MovieListAPIDataManagerInputProtocol?
    var localDatamanager: MovieListLocalDataManagerInputProtocol?
    
    init() {}
}