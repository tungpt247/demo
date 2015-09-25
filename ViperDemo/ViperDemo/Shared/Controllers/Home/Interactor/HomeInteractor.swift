//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol
{
    weak var presenter: HomeInteractorOutputProtocol?
    var APIDataManager: HomeAPIDataManagerInputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol? = HomeLocalDataManager()
    
    init() {}
    
    func fetchLocalData(completion: (error: NSError?) -> ()) {
        localDatamanager?.fetchLocalData(completion)
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return localDatamanager!.numberOfItems(inSection: section)
    }
    
    func numberOfSections() -> Int {
        return localDatamanager!.numberOfSections()
    }
    
    func homeItemAtIndexPath(index:NSIndexPath) -> HomeItem {
        return localDatamanager!.homeItemAtIndexPath(index)
    }
}