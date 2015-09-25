//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import UIKit

class GenreListPresenter: GenreListPresenterProtocol, GenreListInteractorOutputProtocol
{
    weak var view: GenreListViewProtocol?
    var interactor: GenreListInteractorInputProtocol? = GenreListInteractor()
    var wireFrame: GenreListWireFrameProtocol? = GenreListWireFrame()
    
    init() {}
    
    func fetchLocalData(completion: (error: NSError?) -> ()) {
        interactor?.fetchLocalData(completion)
    }
    
    func numberOfItems() -> Int {
        if interactor != nil {
            return interactor!.numberOfItems()
        }
        return 0
    }
    
    func numberOfSections() -> Int {
        if interactor != nil {
            return interactor!.numberOfSections()
        }
        return 0
    }
    
    func setContentToView(view: GenreListItemViewProtocol, index: Int) {
        let genreListItem: GenreListItem = interactor!.genreListItemAtIndexPath(index)
        view.set(name: genreListItem.name!)
        view.set(image: genreListItem.image!)
    }
    
    func genreListItemAtIndexPath(index:Int) -> GenreListItem {
        return interactor!.genreListItemAtIndexPath(index)
    }
    
    func footerView(fromView view: UIView) -> UIView {
        return wireFrame!.footerView(fromView: view)
    }
    
    func userDidSelectGenreItem(atIndexPath indexPath: NSIndexPath, controller: UINavigationController, cellView: UITableViewCell) {
        let item: GenreListItem = interactor!.genreListItemAtIndexPath(indexPath.row)
        wireFrame!.presentGenre(selectedNewsItem: item, view: controller, completion: nil)
    }
}