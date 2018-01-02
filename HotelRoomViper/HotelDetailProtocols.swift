//
//  HotelDetailProtocols.swift
//  HotelRoomViper
//
//  Created by sebastian on 2/01/18.
//  Copyright © 2018 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

protocol HotelDetailViewProtocol : class {
    
    var presenter: HotelDetailPresenterProtocol? { get set }
    
    func showHotelDetail(forHotel hotel: Hotel)
}

protocol HotelDetailWireframeProtocol : class {
    
    static func createHotelDetailModule(forHotel hotel: Hotel) -> UIViewController
}

protocol HotelDetailPresenterProtocol : class {
    
    var view: HotelDetailViewProtocol? { get set }
    var wireframe: HotelDetailWireframeProtocol? { get set }
    var hotel : Hotel? {get set}
    
    func viewDidLoad()
}
