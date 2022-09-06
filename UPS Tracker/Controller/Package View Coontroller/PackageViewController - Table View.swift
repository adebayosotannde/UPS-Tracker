//
//  PackageViewController - Table View.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation
import UIKit


//MARK: - Table View Functions DataSource and Relevant Functions
extension PackageViewController: UITableViewDataSource
{
    
    func registerTableViewCells()
    {
        let textFieldCell = UINib(nibName: ActivityTableViewCell.classIdentifier,bundle: nil)
        self.packgeTableViewController.register(textFieldCell,forCellReuseIdentifier: ActivityTableViewCell.cellIdentifier)
    }
    
    func configureTableView()
    {
        //Makes The table View look nice
        packgeTableViewController.showsVerticalScrollIndicator = false
        packgeTableViewController.separatorStyle = .none  //Hides the lines
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if passedPackage?.isValidTrackingNumber == false
        {
            return 0
        }
    
        let trackingData = try? JSONDecoder().decode(UPSJSONDATA.self, from: (passedPackage?.testData)!)
        let count = (trackingData?.trackResponse.shipment[0].package[0].activity?.count)
        return count!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    
        //Create Cell First
        let cell = packgeTableViewController.dequeueReusableCell(withIdentifier: ActivityTableViewCell.cellIdentifier) as! ActivityTableViewCell
        
        //Set Data Here
        let data: DataObjectManager = DataObjectManager(package: passedPackage!)
        cell.descriptionLabel.text = data.getDescriptionLabelForCell(indexPath: indexPath)
        cell.locationLabel.text = data.getLocationLabelForCel(indexPath: indexPath)
        cell.dateLabel.text = data.getDateForCell(indexPath: indexPath)
        cell.timeLabel.text = data.getTimeForCell(indexPath: indexPath)
    
        return cell
    }
    
}

//MARK: - Table View Functions DataSource and Relevant Functions
extension PackageViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120
        //return 110 //Origina. Return
    }
}


