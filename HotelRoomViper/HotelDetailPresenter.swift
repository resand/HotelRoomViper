//
//  HotelDetailPresenter.swift
//  HotelRoomViper
//
//  Created by sebastian on 2/01/18.
//  Copyright © 2018 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation

class HotelDetailPresenter: HotelDetailPresenterProtocol {
    
    weak var view: HotelDetailViewProtocol?
    var wireframe: HotelDetailWireframeProtocol?
    var hotel : Hotel?
    
    /*
     Función que permite indicar a la vista que muestre los detalles de un hotel.
     */
    func viewDidLoad(){
        view?.showHotelDetail(forHotel: hotel!)
    }
}
