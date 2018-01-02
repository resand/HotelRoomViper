//
//  Protocols.swift
//  HotelRoomViper
//
//  Created by sebastian on 23/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

protocol HotelListViewProtocol: class {
    
    var presenter: HotelListPresenterProtocol? { get set }
    
    //PRESENTER -> VIEW
    func showHotels(with hotels: [Hotel])

    func showError()
    
    func showLoading()
    
    func hideLoading()
    
}

protocol HotelListPresenterProtocol: class {
    
    var view: HotelListViewProtocol? { get set }
    var wireframe: HotelListWireframeProtocol? { get set }
    var interactor: HotelListInteractorInputProtocol? { get set }
    
    //VIEW -> PRESENTER
    func viewDidLoad()
    func showHotelDetail(forHotel hotel: Hotel)
    
}

protocol HotelListInteractorInputProtocol: class {
    
    //La variable es de tipo HotelListInteractorOutputProtocol porque es la salida del interactor.
    var presenter: HotelListInteractorOutputProtocol? { get set }
    
    var remoteDataManager: HotelListRemoteDataManagerInputProtocol? { get set }
    
    //PRESENTER -> INTERACTOR
    func retrieveHotelList()
}

protocol HotelListWireframeProtocol: class {

    //Función donde se conectan todos los modulos.
    static  func createHotelListModule() -> UIViewController
    
    //PRESENTER -> WIREFRAME
    func presenterHotelDetailScreen(from view: HotelListViewProtocol, forHotel hotel: Hotel)
    
}


protocol HotelListInteractorOutputProtocol: class {
    //INTERACTOR -> PRESENTER
    func didRetrieveHotels(_ hotels: [Hotel])
    func onError()
}

protocol HotelListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: HotelListRemoteDataManagerOutputProtocol? {get set}
    
    //INTERACTOR -> REMOTEDATAMANAGER
    func retrieveHotelList()
}

protocol HotelListRemoteDataManagerOutputProtocol: class {
    
    //REMOTEDATAMANAGER -> INTERACTOR
    func onHotelsRetrieved(_ hotels: [Hotel])
    func onError()
    
}

