//
//  AddTrackingViewController - Data Manipulation.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation

extension AddTrakingNumberViewController
{
    func addTrackingNumber(newPackge: PackageObject)
    {
        CoreDataManager.sharedManager.insertPackageObject(newObject: newPackge) //Add Object to Core Data
        //FirebaseManager.sharedManager.addTrackingNumberToFirebase(newObject: newPackge) // Add Object to Firebase Database
    NetWorkManager.sharedManager.requestData(packageDetail: newPackge)
    }
    func randomString(length: Int) -> String
    {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func checkForDuplicaterTrackingNumber(trackingNumber: String) -> Bool
    {
        pacakges = CoreDataManager.sharedManager.loadTrackingNumber()

        for pacakge in pacakges
        {
            if (pacakge.trackingNumber!.description == trackingNumber)
            {
                print("Pacakge Exist already")
                return true
            }
        }
        return false
    }
}
