//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import UIKit

class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol
{
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol? = HomeInteractor()
    var wireFrame: HomeWireFrameProtocol? = HomeWireFrame()
    
    init() {}
    
    func fetchLocalData(completion: (error: NSError?) -> ()) {
        interactor?.fetchLocalData(completion)
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return interactor!.numberOfItems(inSection: section)
    }
    
    func numberOfSections() -> Int {
        return interactor!.numberOfSections()
    }
    
    func setContentToView(view: HomeItemViewProtocol, index: NSIndexPath) {
        let homeItem: HomeItem = interactor!.homeItemAtIndexPath(index)
        view.set(name: homeItem.name!)
        view.set(image: homeItem.image!)
    }
    
    func homeItemAtIndexPath(index:NSIndexPath) -> HomeItem {
        return interactor!.homeItemAtIndexPath(index)
    }
    
    func userDidSelectHomeItem(atIndexPath indexPath: NSIndexPath, controller: UINavigationController, cellView: UITableViewCell) {
        let item: HomeItem = interactor!.homeItemAtIndexPath(indexPath)
        wireFrame!.presentDiscover(selectedNewsItem: item, view: controller, completion: nil)
    }
}