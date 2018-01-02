//
//  HotelDetailView.swift
//  HotelRoomViper
//
//  Created by sebastian on 2/01/18.
//  Copyright © 2018 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class HotelDetailView: UIViewController {

    //Variables
    
    @IBOutlet var hotelDetailImage: UIImageView!
    @IBOutlet var hotelTypeLabel: UILabel!
    @IBOutlet var hotelSizeLabel: UILabel!
    @IBOutlet var hotelDetailNameLabel: UILabel!
    @IBOutlet var hotelGuestsLabel: UILabel!
    @IBOutlet var hotelBedroomsLabel: UILabel!
    @IBOutlet var hotelBedsLabel: UILabel!
    @IBOutlet var hotelBathroomsLabel: UILabel!
    @IBOutlet var hotelDescriptionLabel: UILabel!
    
    var presenter: HotelDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension HotelDetailView : HotelDetailViewProtocol {
    
    /*
     Function to show hotel information on the view.
     */
    func showHotelDetail(forHotel hotel: Hotel) {
        
        hotelDetailNameLabel.text = hotel.name
        hotelTypeLabel.text = hotel.propertyType
        hotelSizeLabel.text = "ES UN HOTEL"
        hotelDescriptionLabel.text = "ES SEVERO HOTEL"
        hotelGuestsLabel.text = "\(hotel.guests)" ?? "0"
        hotelBedsLabel.text = "\(hotel.beds)" ?? "0"
        hotelBedroomsLabel.text = "\(hotel.bedrooms)" ?? "0"
        hotelBathroomsLabel.text = "\(hotel.bathrooms)" ?? "0"
               
        
        let url = URL(string: (hotel.imageUrl)!)
        let placeHolder = UIImage(named: "placeholder")
        hotelDetailImage.af_setImage(withURL: url!, placeholderImage: placeHolder)
        

    }

    
}
