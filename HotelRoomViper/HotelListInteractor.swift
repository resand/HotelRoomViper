//
//  HotelListInteractor.swift
//  HotelRoomViper
//
//  Created by sebastian on 24/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation

class HotelListInteractor: HotelListInteractorInputProtocol {
    
    //Variable.
    
    weak var presenter: HotelListInteractorOutputProtocol?
    var remoteDataManager: HotelListRemoteDataManagerInputProtocol?
    
    /*
     Function to recover data from the remoteDataManager.
     */
    func retrieveHotelList(){
        
        do {
            try remoteDataManager?.retrieveHotelList()
        } catch  {
            presenter?.didRetrieveHotels([])
        }
    }
    
}

extension HotelListInteractor: HotelListRemoteDataManagerOutputProtocol{
    
    /*
     Function to send hotel data to presenter.
     */
    func onHotelsRetrieved(_ hotels: [Hotel]){
        print("LLEGO")
        presenter?.didRetrieveHotels(hotels)
    }
    
    /*
     Function to indicate to the presenter if has ocurred an error.
     */
    func onError(){
        presenter?.onError()
    }
}
