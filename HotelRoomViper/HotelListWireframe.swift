//
//  HotelListWireframe.swift
//  HotelRoomViper
//
//  Created by sebastian on 24/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

class HotelListWireframe: HotelListWireframeProtocol {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    /*
    Función donde se conectan todos los modulos.
    */
    static  func createHotelListModule() -> UIViewController {
        
        let navController = storyboard.instantiateViewController(withIdentifier: "HotelNavigationController")
        
        if let view = navController.childViewControllers.first as? HotelListView {
            
            let presenter : HotelListPresenterProtocol & HotelListInteractorOutputProtocol = HotelListPresenter()
            let interactor : HotelListInteractorInputProtocol & HotelListRemoteDataManagerOutputProtocol = HotelListInteractor()
            let remoteDataManager : HotelListRemoteDataManagerInputProtocol = HotelListRemoteDataManager()
            let wireframe : HotelListWireframeProtocol = HotelListWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireframe = wireframe
            interactor.presenter = presenter
            interactor.remoteDataManager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
        
    }
    
    //PRESENTER -> WIREFRAME
    func presenterHotelDetailScreen(from view: HotelListViewProtocol, forHotel hotel: Hotel){
        
        let hotelDetailViewController = HotelDetailWireframe.createHotelDetailModule(forHotel: hotel)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(hotelDetailViewController, animated: true)
        }
        
    }
    
}
