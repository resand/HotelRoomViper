//
//  HotelCell.swift
//  HotelRoomViper
//
//  Created by sebastian on 24/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit
import AlamofireImage

class HotelCell: UITableViewCell {

    //Cell variables.
    
    @IBOutlet var hotelImage: UIImageView!
    
    @IBOutlet var hotelPriceLabel: UILabel!
    
    @IBOutlet var hotelNameLabel: UILabel!
    
    @IBOutlet var hotelTypeLabel: UILabel!
    
    
    /*
     Function to set a cell with the information brought through the hotel Object.
     */
    func set(forHotel hotel: Hotel){
    
        self.selectionStyle = .none
        hotelPriceLabel.text = "$ \(hotel.price!)"
        hotelNameLabel.text = hotel.name
        hotelTypeLabel.text = hotel.propertyType
        
        let url = URL(string: (hotel.imageUrl)!)
        let placeHolder = UIImage(named: "placeholder")
        hotelImage.af_setImage(withURL: url!, placeholderImage: placeHolder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
