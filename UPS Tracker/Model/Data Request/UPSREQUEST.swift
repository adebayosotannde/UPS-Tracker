//
//  UPSREQUEST.swift
//  Track It
//
//  Created by Adebayo Sotannde on 1/18/22.
//
//import Foundation
import CoreData
//import UIKit

class UPSREQUEST
{
    //APi Key's
    let accessLicenseNumber = "ADA63D6F8AE82A95" //UPS Access Number
    var passedPackage: PackageObject
    init(package: PackageObject)
    {
      passedPackage = package//Set the package object
        retriveData(trackingNumber: passedPackage.trackingNumber!)
    }
    
    func retriveData(trackingNumber: String)
    {

        let url = URL(string: "https://onlinetools.ups.com//track/v1/details/" + trackingNumber + "?locale=en_US" )

        guard let requestUrl = url else
        {
            print("UPS: Error Parsing Data")
            return
        }

        var request = URLRequest(url: requestUrl) // Create URL Request
        request.httpMethod = "GET"  // Specify HTTP Method to use
        request.setValue(accessLicenseNumber, forHTTPHeaderField: "AccessLicenseNumber") // Set HTTP Request Header

        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request)
        { [self] (data, response, error) in

        // Check if Error took place
        if let error = error
        {
                        print("Error took place \(error)")
                        return
        }

        //Read HTTP Response Status code
            if let response = response as? HTTPURLResponse
            {
            }
     
//        if let response = response as? HTTPURLResponse
//        {
//
//        }
//
        // Convert HTTP Response Data to a simple String
        if let data = data, let dataString = String(data: data, encoding: .utf8)
        {
            print(dataString)
            guard (try? JSONDecoder().decode(UPSJSONDATA.self, from: dataString.data(using: .utf8)!)) != nil else
            {
                print("Failed: Invalid Tracking Number")
                CoreDataManager.sharedManager.updateInvalidTrackingNumber(package: self.passedPackage, boolValue: false)
                return
            }
            
           
            let data = DataObjectManager(package: self.passedPackage)

            self.passedPackage.testData = dataString.data(using: .utf8)
            self.passedPackage.isValidTrackingNumber = true // set tracking number
            self.passedPackage.currentDescription = data.getMostRecentActivityDescription()
            self.passedPackage.circleIndicatorColor = data.getMostRecentColorIndicatorStatus()
            self.passedPackage.lastUpdated = data.getWhenThePackageWasLastUpdated()
            
            
            self.passedPackage.lastLocation = data.getMostRecentLocation()
            self.passedPackage.delivered = data.getIfPackageHasbeenDelivered()
            
            
            CoreDataManager.sharedManager.save()
            
      
        }


        }
                task.resume()
        
    }
    
}



