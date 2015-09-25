//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class GenreListInteractor: GenreListInteractorInputProtocol
{
    weak var presenter: GenreListInteractorOutputProtocol?
    var APIDataManager: GenreListAPIDataManagerInputProtocol?
    var localDatamanager: GenreListLocalDataManagerInputProtocol? = GenreListLocalDataManager()
    
    init() {}
    
    func fetchLocalData(completion: (error: NSError?) -> ()) {
        localDatamanager?.fetchLocalData(completion)
    }
    
    func numberOfItems() -> Int {
        if localDatamanager != nil {
            return localDatamanager!.numberOfItems()
        }
        return 0
    }
    
    func numberOfSections() -> Int {
        if localDatamanager != nil {
            return localDatamanager!.numberOfSections()
        }
        return 0
    }
    
    func genreListItemAtIndexPath(index:Int) -> GenreListItem {
        return localDatamanager!.genreListItemAtIndexPath(index)
    }
}