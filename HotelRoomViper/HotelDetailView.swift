//
//  HotelDetailView.swift
//  HotelRoomViper
//
//  Created by sebastian on 2/01/18.
//  Copyright © 2018 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class HotelDetailView: UIViewController {

    @IBOutlet var hotelDetailImage: UIImageView!
    @IBOutlet var hotelTypeLabel: UILabel!
    @IBOutlet var hotelSizeLabel: UILabel!
    @IBOutlet var hotelDetailNameLabel: UILabel!
    @IBOutlet var hotelGuestsLabel: UILabel!
    @IBOutlet var hotelBedroomsLabel: UILabel!
    @IBOutlet var hotelBedsLabel: UILabel!
    @IBOutlet var hotelBathroomsLabel: UILabel!
    @IBOutlet var hotelDescriptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
