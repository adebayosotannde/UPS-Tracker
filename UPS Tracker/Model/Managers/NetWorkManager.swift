//
//  NetWorkManager.swift
//  UPS Tracker
//
//  Created by Adebayo Sotannde on 9/4/22.
//

import Foundation

class NetWorkManager
{
    
    static let sharedManager = NetWorkManager() //Create Instance of Persistance Contaner
    private init() {} // Prevent clients from creating another instance.

    func requestData(packageDetail: PackageObject)
    {
        print("Carrier Set ss \(packageDetail.packageCarrier?.lowercased())")
        //Performing Network Call Depending on the Carrier Selected and the Tracking Number Provided.
        switch packageDetail.packageCarrier?.lowercased()
        {
        case "ups":
           UPSREQUEST(package: packageDetail) //Quiery the UPS API Against the tracking Number
        case "ups ground freight":
           UPSREQUEST(package: packageDetail) //Quiery the UPS API Against the tracking Number
        case "fedex":
            print("Fedex added")
        default:
            print("Something Happened")
        }
    }
}





