//
//  FirebaseManager.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation

class FirebaseManager
{
    static let sharedManager = FirebaseManager() //Create Instance of Persistance Contaner
  private init() {} // Prevent clients from creating another instance.
    

    
    func addTrackingNumberToFirebase(newObject: PackageObject)
    {
//        let dict =
//        [
//            "tracking_Number": newObject.trackingNumber!,
//                    "id": newObject.id!,
//                    "package_Description": newObject.packageDescription!,
//                    "package_Carrier": newObject.packageCarrier!,
//                    "circle_Indicator_Color": newObject.circleIndicatorColor!,
//                    "current_Description": newObject.currentDescription!,
//                    "carrier_LogoName": newObject.carrierLogoName!
//        ]
//
//       // db.collection("tracking_Numbers").addDocument(data: dict) //Add without Custom ID
//        db.collection("tracking_Numbers").document(newObject.id!).setData(dict) //Add Document with ID
    }
    
    func deletePackageFromFirebase(objectToDelete: PackageObject)
    {
        
    }
    
    

}




//   func getData()
//        {
//
//            if rerivedData.count == 0
//            {
//            userJustSignedIn = true
//            }
//            else
//            {
//                userJustSignedIn = false
//            }
//            // Read the documents at a specific path
//            db.collection("tracking_Numbers").getDocuments { snapshot, error in
//
//                // Check for errors
//                if error == nil {
//                    // No errors
//
//                    if let snapshot = snapshot {
//
//                        // Update the list property in the main thread
//                        DispatchQueue.main.async {
//
//                            // Get all the documents and create Todos
//                            self.rerivedData = snapshot.documents.map { d in
//
//                                var objectReturened = FireBasePackageObject(id: d.documentID, trackingNumber: d["tracking_Number"] as! String, packageDescription: d["package_Description"] as! String, packageCarrier: d["package_Carrier"] as! String, circleIndicatorColor: d["circle_Indicator_Color"] as! String, currentDescription: d["current_Description"] as! String, carrierLogoName: d["carrier_LogoName"] as! String)
//                                return objectReturened
//                            }
//                        }
//
//
//                    }
//                }
//                else {
//                   print("Error Retriving Data")
//                }
//            }
//        }
//
//
//}
