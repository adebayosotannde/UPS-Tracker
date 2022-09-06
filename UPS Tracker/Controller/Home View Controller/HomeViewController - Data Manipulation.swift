//
//  CoreDate - Home View Controller.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/8/22.
//

import Foundation
import UIKit
import CoreData

//MARK: - Data Manipulation
extension HomeViewController
{
    
    func addPackageObject(newObject: PackageObject)
    {
        CoreDataManager.sharedManager.insertPackageObject(newObject: newObject) //Add Object to Core Data
        FirebaseManager.sharedManager.addTrackingNumberToFirebase(newObject: newObject) // Add Object to Firebase Database
       // NetWorkManager.sharedManager.requestData(packageDetail: newObject)
    }
    
    func deletePackageObject(deleteObject: PackageObject)
    {
        FirebaseManager.sharedManager.deletePackageFromFirebase(objectToDelete: deleteObject) //Delete Package object from Firebase
        CoreDataManager.sharedManager.delete(person: deleteObject) //Delete Package Object from Core Data
    }
    

    func refreshDataForAllPackages()
    {
        CoreDataManager.sharedManager.fetchDataForAllPackages()
    }
}


