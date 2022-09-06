//
//  PackageViewController - Notification Center.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation


//MARK: - Notification Canter
extension PackageViewController
{
    
    func postBarcodeNotification(code: String)
    {
        var info = [String: String]()
        info[code.description] = code.description //Notification to post
        NotificationCenter.default.post(name: Notification.Name(rawValue: StringLiteral.notificationKey), object: nil, userInfo: info)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @objc func doWhenNotified(_ notiofication: NSNotification)
    {
      
        if let dict = notiofication.userInfo as NSDictionary?
        {
            if let dict = notiofication.userInfo as NSDictionary?
            {
                if (dict[StringLiteral.refreshPackageActivityScreen] as? String) != nil
              {
              initialSetup()
              }
                
                if (dict[StringLiteral.updatePackageViewController] as? String) != nil
                {
                    
                    updatePageWithObject()
                    
                    //This allows the user to move the map and only updates if a new location is observerd
                    //Note: Since the Refresh Controller will cause an update from the notification center is is crutial that the ui is responsive while the user is inside of it.
                    if lastLocation == passedPackage?.lastLocation
                    {
                    }
                    else
                    {
                        setMapViewLocation()
                    }
                    
                    
                   
                    
                }
                
            
        }
    }
    
}
    
    
    public func updateUI()
    {
        //Reload Table View with the new non updated packages array]
       
        packgeTableViewController.reloadData()
        
    }

}
