//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

class GenreListView: UITableViewController, GenreListViewProtocol
{
    var presenter: GenreListPresenterProtocol? = GenreListPresenter()
    
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
        tableView!.registerNib(UINib(nibName: "GenreCell", bundle: nil), forCellReuseIdentifier: "genreCell")
    }
    
    // MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfItems()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return presenter!.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let genreCell: GenreCell = self.tableView.dequeueReusableCellWithIdentifier("genreCell", forIndexPath: indexPath) as! GenreCell
        genreCell.selectionStyle = .None
        presenter?.setContentToView(genreCell, index: indexPath.section)
        
        return genreCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        presenter!.userDidSelectGenreItem(atIndexPath: indexPath, controller: self.navigationController!, cellView: cell!)
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return presenter!.footerView(fromView: self.view)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    // MARK: UITableViewDelegate
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 142
    }
}