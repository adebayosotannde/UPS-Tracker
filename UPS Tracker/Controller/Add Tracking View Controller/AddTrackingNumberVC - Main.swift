//
//  AddTrakingNumberViewController.swift
//  Track It
//
//  Created by Adebayo Sotannde on 1/17/22.
//
import UIKit
import CoreData

//MARK: - Main Class
class AddTrakingNumberViewController: UIViewController
{
    //MARK: - Variables and Constants
    var pacakges = [PackageObject]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var launchBarcodeViewController = false
    static var storyBoardID = "AddTrakingNumberViewController"
    
    //IBOUTLETS
    @IBOutlet weak var barcodeButton: UIButton!
    @IBOutlet weak var startTrackingButton: UIButton!
    @IBOutlet weak var carrierImage: UIImageView!
    //UITextFileds
    @IBOutlet weak var carrierNameLabel: UITextField!
    @IBOutlet weak var packageDescriptionLabel: UITextField!
    @IBOutlet weak var trackingNumberLabel: UITextField!
    
    @IBAction func startTrackingButtonPressed(_ sender: Any)
    {
        //Checking if Tracking Number Exist Already
      
        let pacakgeExist = checkForDuplicaterTrackingNumber(trackingNumber: trackingNumberLabel.text!)
        
        if pacakgeExist
        {
            //Do Nothing. Inform the User that the package already exists.
           
            //Alert View Controller
            let alert = UIAlertController(title: "Duplicate Pacakge", message: "Pacakge exists already in the system. You cannot add it again.", preferredStyle: UIAlertController.Style.alert)
        
            //Alert Action
            alert.addAction(UIAlertAction(title: "Got it!", style: .destructive, handler:
            { UIAlertAction in
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            }))
        
        
           self.present(alert, animated: true, completion: nil)//Displays the Alert Box
        }
        else
        {
        
            let newPackage = PackageObject(context: self.context)
            
            //Set Package properties
            newPackage.trackingNumber = trackingNumberLabel.text!
            newPackage.packageDescription = packageDescriptionLabel.text
            newPackage.packageCarrier = carrierNameLabel.text!
            newPackage.circleIndicatorColor = StringLiteral.redColor
            newPackage.currentDescription =  StringLiteral.defaultDescription
            newPackage.carrierLogoName = carrierNameLabel.text!
            newPackage.id = randomString(length: 20)

            addTrackingNumber(newPackge: newPackage)
            
            navigationController?.popViewController(animated: true) // Pop Current View Controller from Nav Controller.
        }
        
    }

}

