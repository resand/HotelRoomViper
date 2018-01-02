
//  HotelListRemoteDataManager.swift
//  HotelRoomViper
//
//  Created by sebastian on 24/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class HotelListRemoteDataManager: HotelListRemoteDataManagerInputProtocol {
    
    //Variables
    
    var remoteRequestHandler: HotelListRemoteDataManagerOutputProtocol?
    
    /*
     Function which recover information from the API.
     */
    func retrieveHotelList(){
        
        Alamofire
        .request(Endpoints.Hotels.fetch.url, method: .get)
        .validate()
        .responseArray(keyPath: "search_results") { (response: DataResponse<[Hotel]>) in
            
            

        switch response.result {
            

            case .success(let hotels):
            
           /*     //print(response.result.value?.count)
              let arrayHotels = response.result.value
              var hotels: [Hotel] = []
              for hotel in arrayHotels!{
                
                hotels.append(hotel)
              }*/
                
                print(hotels)
              self.remoteRequestHandler?.onHotelsRetrieved(hotels)
                print("llega")
                        case .failure(_):
                            print(response.result)
                            self.remoteRequestHandler?.onError()
                        }
            
        }
        
        
    }
}
