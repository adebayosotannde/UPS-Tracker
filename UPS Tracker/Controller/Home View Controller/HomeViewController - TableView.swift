//
//  HomeViewController - TableView.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation
import UIKit

//MARK: - Table View Functions DataSource and Relevant Functions
extension HomeViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if isFiltering
        {
           return filteredPackages.count
         }
        return packages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //Create a represnetation of the cell to be usesd.
        let cell = packageTableView.dequeueReusableCell(withIdentifier: PackageTableViewCell.cellIdentifier) as! PackageTableViewCell
        
        //A Package object is decleared.
        let aPackage: PackageObject
        
        if isFiltering
        {
            aPackage = filteredPackages[indexPath.row]
        }
        else
        {
            aPackage = packages[indexPath.row]
        }
        
        cell.carrierNameAndTracking.text = aPackage.packageCarrier! + ": " + aPackage.trackingNumber!
        cell.packageDescription.text = aPackage.packageDescription
        cell.logoImage.image = UIImage(named: aPackage.carrierLogoName!.lowercased())
        cell.packageCurrentDescription.text = aPackage.currentDescription! //Good
        cell.circleIndicator.tintColor = UIColor(named:  aPackage.circleIndicatorColor! )
        return cell

    }
    
}

//MARK: - Table View Functions Delgate and Relevant Functions
extension HomeViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 110
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
      
        
        if editingStyle == .delete
        {
            pauseRefresh = true
            CoreDataManager.sharedManager.delete(person: packages[indexPath.row])
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let packageView = storyBoard.instantiateViewController(withIdentifier: PackageViewController.storyBoardID) as! PackageViewController
        
        //Determine the Package to Pass to PackageVC based on if App is filtering or not
        let aPackage: PackageObject
        
        if isFiltering
        {
            aPackage = filteredPackages[indexPath.row]
        }
        else
        {
            aPackage = packages[indexPath.row]
        }
        
        packageView.passedPackage = aPackage
        packageView.packageIndex = indexPath.row
        packageView.modalPresentationStyle = .fullScreen
        packageView.modalTransitionStyle = .crossDissolve
        tableView.deselectRow(at: indexPath, animated: true)
        packageView.modalPresentationStyle = .popover
        navigationController?.pushViewController(packageView, animated: true)
    }
    
}



