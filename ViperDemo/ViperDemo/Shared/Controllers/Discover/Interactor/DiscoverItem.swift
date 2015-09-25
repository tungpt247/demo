//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

struct DiscoverItem
{
    var id:Int?
    var name:String?
    var image:String?
}

extension DiscoverItem {
    init(jsonDict:[String:AnyObject]) {
        if let id = jsonDict["id"] as? Int { self.id = id }
        if let title = jsonDict["name"] as? String { self.name = title }
        if let icon =  jsonDict["image"] as? String { self.image = icon }
    }
}