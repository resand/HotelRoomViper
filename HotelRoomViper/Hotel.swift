//
//  Hotel.swift
//  HotelRoomViper
//
//  Created by sebastian on 21/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import ObjectMapper

struct Hotel {
    
    //Variables
    
    var name: String?
    var guests: String?
    var bathrooms: String?
    var beds: String?
    var bedrooms: String?
    var imageUrl: String?
    var propertyType: String?
    var price: Int?

}

extension Hotel: Mappable{
    
    init?(map: Map) {
        
    }
    //Function which map the json in a struct.
    mutating func mapping(map: Map) {
       
        name    <- map["listing.name"]
        guests  <-  map["listing.person_capacity"]
        bathrooms   <-  map["listing.bathrooms"]
        beds    <-  map["listing.beds"]
        bedrooms    <-  map["listing.bedrooms"]
        imageUrl    <-  map["listing.picture_url"]
        propertyType   <-   map["listing.property_type"]
        price    <-  map["pricing_quote.localized_nightly_price"]
    }
}


