//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class DiscoverInteractor: DiscoverInteractorInputProtocol
{
    weak var presenter: DiscoverInteractorOutputProtocol?
    var APIDataManager: DiscoverAPIDataManagerInputProtocol?
    var localDatamanager: DiscoverLocalDataManagerInputProtocol?
    
    init() {}
}