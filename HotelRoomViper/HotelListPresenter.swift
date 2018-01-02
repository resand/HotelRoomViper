//
//  HotelListPresenter.swift
//  HotelRoomViper
//
//  Created by sebastian on 24/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation

class HotelListPresenter: HotelListPresenterProtocol {
    
    //Variables.
    
    weak var view: HotelListViewProtocol?
    var wireframe: HotelListWireframeProtocol?
    var interactor: HotelListInteractorInputProtocol?
    

    /*
     Function to request hotel data from the interactor.
     */
    func viewDidLoad() {
        
        view?.showLoading()
        interactor?.retrieveHotelList()
    }
    
    /*
     Function to move to hotelDetailView.
     */
    func showHotelDetail(forHotel hotel: Hotel){
        
        wireframe?.presenterHotelDetailScreen(from: view!, forHotel: hotel)
    }
    
}


extension HotelListPresenter: HotelListInteractorOutputProtocol{
    
    /*
     Function to send hotel data to view.
     */
    func didRetrieveHotels(_ hotels: [Hotel]){
        view?.hideLoading()
        view?.showHotels(with: hotels)
    }
    
    /*
     Function to indicate if an error is happening.
     */
    func onError(){
    
        view?.hideLoading()
        view?.showError()
    }
}
