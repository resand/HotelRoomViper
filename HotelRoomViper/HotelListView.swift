//
//  HotelListView.swift
//  HotelRoomViper
//
//  Created by sebastian on 24/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit
import PKHUD

class HotelListView: UIViewController {

    //View variables
    @IBOutlet var tableView: UITableView!
    
    //Module Variables.
    var presenter: HotelListPresenterProtocol?
    var hotelList: [Hotel] = []
    
    /*
     Function which make a request to presenter to get the hotels information.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        

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

extension HotelListView: HotelListViewProtocol{
    
    /*
     Function which show the hotels on the tableView.
     */
    func showHotels(with hotels: [Hotel]){
        hotelList = hotels
        tableView.reloadData()
    }
    
    /*
     Function which a HUD Error.
     */
    func showError(){
        HUD.flash(.label("Internet not Connected"), delay: 2.0)
    }
    
    /*
     Function to show a HUD Loading.
     */
    func showLoading(){
        HUD.show(.progress)
    }
    
    /*
     Function to hide a HUD.
     */
    func hideLoading(){
        HUD.hide()
    }
        
}

extension HotelListView: UITableViewDataSource, UITableViewDelegate {
    
    /*
     Determinate how many sections will have the tableView.
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /*
     Determinate how many rows will have a section.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelList.count
    }

    /*
     Set which information will show a cell.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "hotelCell", for: indexPath) as! HotelCell
        
        let hotel = hotelList[indexPath.row]
        
        cell.set(forHotel: hotel)
        
        return cell
        
    }
    
    /*
     Behavior of a cell when it is selected.
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let hotel = hotelList[indexPath.row]
        
        presenter?.showHotelDetail(forHotel: hotel)
    }

}
