//
//  WebSiteRequest.swift
//  Track It
//
//  Created by Adebayo Sotannde on 1/21/22.
//

import Foundation
import UIKit
import SafariServices

//class WebSiteRequest
class WebSiteManager
{
    static let sharedManager = WebSiteManager() //Create Instance of Persistance Contaner
  private init() {} // Prevent clients from creating another instance.
    
    
    func launchSite (packageDetail: PackageObject)
    {
        //Performing Network Call Depending on the Carrier Selected and the Tracking Number Provided.
        switch packageDetail.packageCarrier?.lowercased()
        {
        case "ups":
            let baseURL = "https://www.ups.com/track?loc=null&tracknum="
            let trackingNumber = packageDetail.trackingNumber!.replacingOccurrences(of: " ", with: "")
           
            if let url = URL(string: baseURL + trackingNumber)
            {
              
//                print(url)
UIApplication.shared.open(url)
               
                
            
            }
            
        default:
            print("Something Happened")
        }
        print("Website launched")
        
    }
}
