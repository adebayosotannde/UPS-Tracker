//
//  EditTrackingNumberViewController.swift
//  Track It
//
//  Created by Adebayo Sotannde on 1/22/22.
//

import UIKit
import CoreData

//MARK: - Main View
class EditTrackingNumberViewController: UIViewController
{
    
    //1ZW94F020317630101
    
    //MARK: - Variables and Constants
    var passedPackage:PackageObject?
    var indexPassed = 0
    var pacakges = [PackageObject]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var launchBarcodeViewController = false
    static var storyBoardID = "EditTrackingNumberViewController"
    
    //IBOUTLETS
    @IBOutlet weak var barcodeButton: UIButton!
    
    @IBOutlet weak var startTrackingButton: UIButton!
    @IBOutlet weak var carrierImage: UIImageView!
    
    //UITextFileds
    @IBOutlet weak var carrierNameLabel: UITextField!
    @IBOutlet weak var packageDescriptionLabel: UITextField!
    @IBOutlet weak var trackingNumberLabel: UITextField!
    
    @IBAction func saveTrackingButtonPressed(_ sender: Any)
    {
        
        passedPackage?.trackingNumber = trackingNumberLabel.text
        passedPackage?.packageDescription = packageDescriptionLabel.text
        passedPackage?.packageCarrier = carrierNameLabel.text
        passedPackage?.circleIndicatorColor = StringLiteral.redColor
        passedPackage?.currentDescription = StringLiteral.defaultDescription
        passedPackage?.carrierLogoName = carrierNameLabel.text
        passedPackage?.delivered = false //Set the package as not delivered.
        CoreDataManager.sharedManager.save()
        NetWorkManager.sharedManager.requestData(packageDetail: passedPackage!)
       // self.postBarcodeNotification(code: StringLiteral.updatePackageViewController) //Updates the Home Screen View
       
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func barcodeButtonPressed(_ sender: Any)
    {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "BarcodeScnnerViewContoller") as! BarcodeScannerViewContoller
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
}

//MARK: - View Did Functions
extension EditTrackingNumberViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view

        setDataInTextLabel()
        setup()
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    


}

//MARK: - Setup Function
extension EditTrackingNumberViewController
{
    func setup()
    {
        //UIVIEW
        registerTargetForLabel()
        registerDelgateForLabel()
        barcodeButton.blink()//Makes the Barcode Button Blink to grab users attention
        registerNotificationCenter()
    }
}

//MARK: - User Input Validation and Textfiled Fundtion
extension EditTrackingNumberViewController: UITextFieldDelegate
{
    func enableButton()
    {
        startTrackingButton.isEnabled = true
        startTrackingButton.alpha = 1.0
    }
    
    func disableButton()
    {
        startTrackingButton.isEnabled = false
        startTrackingButton.alpha = 0.5
    }
    
    func setDataInTextLabel()
    {
        trackingNumberLabel.text = passedPackage?.trackingNumber
        carrierNameLabel.text = passedPackage?.packageCarrier
        packageDescriptionLabel.text = passedPackage?.packageDescription
    }
    
    func registerTargetForLabel()
    {
        trackingNumberLabel.addTarget(self, action: #selector(AddTrakingNumberViewController.textFieldDidChange(_:)), for: .editingChanged)
        packageDescriptionLabel.addTarget(self, action: #selector(AddTrakingNumberViewController.textFieldDidChange(_:)), for: .editingChanged)
        carrierNameLabel.addTarget(self, action: #selector(AddTrakingNumberViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        
    }
    
    func registerDelgateForLabel()
    {
        self.carrierNameLabel.delegate = self
    }
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        if (trackingNumberLabel.text!.count == 0) || (packageDescriptionLabel.text!.count == 0) ||  (carrierNameLabel.text!.count == 0)
        {
            disableButton()
        }
        else
        {
            enableButton()
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
       
           return false

       }
    
}


//MARK: - Notification Canter
extension EditTrackingNumberViewController
{
    func registerNotificationCenter()
    {
    //Obsereves the Notification
    NotificationCenter.default.addObserver(self, selector: #selector(doWhenNotified(_:)), name: Notification.Name(StringLiteral.notificationKey), object: nil)
    }
    
    func postBarcodeNotification(code: String)
    {
        var info = [String: String]()
        info[code.description] = code.description //post the notification with the key.
        NotificationCenter.default.post(name: Notification.Name(rawValue: StringLiteral.notificationKey), object: nil, userInfo: info)
    }

    @objc func doWhenNotified(_ notiofication: NSNotification)
    {
        
      if let dict = notiofication.userInfo as NSDictionary?
      {
          if let carrier = dict[StringLiteral.postCarrier] as? String
        {
          //Do something
              carrierNameLabel.text = carrier
                 carrierImage.image = UIImage(named: carrier.lowercased())
        }
          
          if let barcode = dict[StringLiteral.barcodeScannedNotification] as? String
        {
              trackingNumberLabel.text = barcode
              
        }
      
      }
 
    }
}


//MARK: - CoreData
extension EditTrackingNumberViewController
{
    func saveTrackingNumber()
    {
        do
        {
            try context.save()
        } catch
        {
            print("Error Saving Context \(error)")
        }
    }
    
     func loadTrackingNumber()
     {
        let request : NSFetchRequest<PackageObject> = PackageObject.fetchRequest()
        do
        {
            pacakges = try context.fetch(request)
        }
         catch
         {
            print("Error Loading Context \(error)")
        }
    }
}
