//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class HomeLocalDataManager: HomeLocalDataManagerInputProtocol
{
    var data:[[HomeItem]] = []
    
    init() {}
    
    func fetchLocalData(completion:(error:NSError?) -> ())  {
        let path = NSBundle.mainBundle().pathForResource("Home", ofType: "plist")
        let items = NSArray(contentsOfFile: path!)!
        
        for item in items {
            let menuData = item as! NSArray
            var arrData:[HomeItem] = []
            
            for menu in menuData {
                let homeItem = HomeItem(jsonDict: menu as! [String:AnyObject])
                arrData.append(homeItem)
            }
            
            data.append(arrData)
        }
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return data[section].count
    }
    
    func numberOfSections() -> Int {
        return data.count
    }
    
    func homeItemAtIndexPath(index:NSIndexPath) -> HomeItem {
        return data[index.section][index.row]
    }
}