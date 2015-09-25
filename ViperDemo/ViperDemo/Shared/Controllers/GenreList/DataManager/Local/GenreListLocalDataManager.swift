//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class GenreListLocalDataManager: GenreListLocalDataManagerInputProtocol
{
    var data:[GenreListItem] = []
    
    init() {}
    
    func fetchLocalData(completion:(error:NSError?) -> ())  {
        let path = NSBundle.mainBundle().pathForResource("Genres", ofType: "plist")
        let items = NSArray(contentsOfFile: path!)!
        
        for item in items {
            let navItem = GenreListItem(jsonDict: item as! [String:AnyObject])
            self.data.append(navItem)
        }
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func numberOfSections() -> Int {
        return self.data.count
    }
    
    func genreListItemAtIndexPath(index:Int) -> GenreListItem {
        return self.data[index]
    }
}