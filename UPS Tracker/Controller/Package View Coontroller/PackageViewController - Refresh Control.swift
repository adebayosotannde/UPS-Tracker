//
//  PackageViewController - Refresh Control.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation

//MARK: - Refresh Contol
extension PackageViewController
{
    
    
    func registerRefreshControl()
    {
        if #available(iOS 10.0, *)
        {
            packgeTableViewController.refreshControl = refreshControl
        } else
        {
            packgeTableViewController.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        refreshControl.attributedTitle = NSAttributedString(string: "updating package", attributes: nil)
        
//        //Package Package is a valid tracking number
//        if ((passedPackage?.isValidTrackingNumber) == true)
//        {
//            refreshControl.attributedTitle = NSAttributedString(string: "refreshing data", attributes: nil)
//        }
//        else
//        {
//            refreshControl.attributedTitle = NSAttributedString(string: "😟 No Data 😕", attributes: nil)
//        }
//
        refreshControl.tintColor = .darkGray
    }
    
    @objc private func refreshData(_ sender: Any)
    {
getUpdates()

        
    }
    
    func getUpdates()
    {
        
//
//            if passedPackage?.delivered == false
//            {
//                DispatchQueue.main.async
//                {
//                    //_ = NetWorkManager(packageDetail: self.passedPackage!) //Tracking Number update
//
//
//                self.postBarcodeNotification(code: StringLiteral.updateHomeViewData) //Updates the Home Screen View
//
//
//                self.postBarcodeNotification(code: StringLiteral.refreshPackageActivityScreen) //Updates the PAckage View
//
//
//
//                    self.refreshControl.endRefreshing() //Removes the Reresh control Animation
//                    self.packgeTableViewController.reloadData() //Reload the table view for the current View Controller
//               }
//            }
//            else
//            {
//
//                self.refreshControl.endRefreshing()
//
//            }
        
        CoreDataManager.sharedManager.fetchDataForAllPackages()
        self.refreshControl.endRefreshing()

    }
    
    func initalUpdate()
    {
//
//        if passedPackage?.delivered == false
//        {
//            DispatchQueue.main.async
//            {
//               // _ = NetWorkManager(packageDetail: self.passedPackage!) //Tracking Number update
//
//
//
//                self.packgeTableViewController.reloadData() //Reload the table view for the current View Controller
//           }
//        }
//        else
//        {
//
//
//
//        }
    }
    
    
}
