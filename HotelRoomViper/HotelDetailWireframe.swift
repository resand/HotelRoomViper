//
//  HotelDetailWireframe.swift
//  HotelRoomViper
//
//  Created by sebastian on 2/01/18.
//  Copyright © 2018 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

class HotelDetailWireframe: HotelDetailWireframeProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createHotelDetailModule(forHotel hotel: Hotel) -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HotelDetailViewController")
        
        if let view = viewController as? HotelDetailView {
            
            let presenter: HotelDetailPresenterProtocol = HotelDetailPresenter()
            let wireframe: HotelDetailWireframeProtocol = HotelDetailWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireframe = wireframe
            presenter.hotel = hotel
            
            return viewController
            
        }
        return UIViewController()
    }

}
