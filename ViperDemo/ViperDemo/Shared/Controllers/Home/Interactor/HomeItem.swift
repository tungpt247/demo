//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

struct HomeItem
{
    var name:String?
    var image:String?
}

extension HomeItem {
    init(jsonDict:[String:AnyObject]) {
        if let title = jsonDict["name"] as? String { self.name = title }
        if let icon =  jsonDict["image"] as? String { self.image = icon }
    }
}