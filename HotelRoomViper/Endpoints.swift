//
//  Endpoints.swift
//  HotelRoomViper
//
//  Created by sebastian on 24/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Hotels: Endpoint {
        case fetch
        
        //No se utiliza por la estructura de la API.
        public var path: String {
            switch self {
            case .fetch: return "/getAllHotels"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)"
            }
        }
    }
}
