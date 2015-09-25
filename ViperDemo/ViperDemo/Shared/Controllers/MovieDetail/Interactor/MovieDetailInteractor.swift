//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorInputProtocol
{
    weak var presenter: MovieDetailInteractorOutputProtocol?
    var APIDataManager: MovieDetailAPIDataManagerInputProtocol?
    var localDatamanager: MovieDetailLocalDataManagerInputProtocol?
    
    init() {}
}