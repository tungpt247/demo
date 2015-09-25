//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UITableViewController, HomeViewProtocol
{
    var presenter: HomePresenterProtocol? = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableDefaults()
        initialize()
    }
    
    func initialize() {
        presenter!.fetchLocalData { (error) -> () in
            self.tableView?.reloadData()
        }
    }
    
    func setTableDefaults() {
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView!.backgroundColor = .blackColor()
        tableView!.registerNib(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "homeCell")
    }
    
    // MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfItems(inSection: section)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return presenter!.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let homeCell: HomeCell = self.tableView.dequeueReusableCellWithIdentifier("homeCell", forIndexPath: indexPath) as! HomeCell
        homeCell.selectionStyle = .None
        homeCell.accessoryType = .DisclosureIndicator
        homeCell.backgroundColor =  UIColor(rgba: "#0F0F0F")
        presenter?.setContentToView(homeCell, index: indexPath)
        
        return homeCell
    }
    
    // MARK: UITableViewDelegate
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        presenter!.userDidSelectHomeItem(atIndexPath: indexPath, controller: self.navigationController!, cellView: cell!)
    }
}