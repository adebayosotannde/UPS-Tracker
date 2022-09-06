//
//  PackageViewController.swift
//  Track It
//
//  Created by Adebayo Sotannde on 1/18/22.
//
import UIKit
import MapKit
import CoreData
import CoreLocation

//MARK: - Main Class
class PackageViewController: UIViewController
{
    //MARK: - Variables and Constants
    static var storyBoardID = "PackageViewController"
    
    var passedPackage:PackageObject?
    var shouldDelete = false
    let refreshControl = UIRefreshControl()
    var pacakges = [PackageObject]()
    var packageIndex: Int = 0
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var lastLocation: String?
    
    //IBOUTLETS
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var currentDescription: UILabel!
    @IBOutlet weak var longerDescriptionLabel: UILabel!
    @IBOutlet weak var longDescriptionView: UIView!
    @IBOutlet weak var longDescriptiopnlayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var lastUpdated: UILabel!
    @IBOutlet weak var estimatedDeliverDateLabel: UILabel!
    //Navigation Items
    @IBOutlet weak var navigationBarLogo: UIImageView!
    @IBOutlet weak var trackingNumberLabel: UILabel!
   
    @IBOutlet weak var geatButton: UIButton!
    @IBOutlet weak var websiteLogo: UIImageView!
    //Table View
    @IBOutlet weak var packgeTableViewController: UITableView!

    //IBACTION: BackButton
    @IBAction func backButtonPressed(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButtonPressed(_ sender: Any)
    {


        let alertController = UIAlertController(title: "Shipment Settings", message: "Choose and Action", preferredStyle: .actionSheet)
        
//        let alertController = UIAlertController()
        
        let logoutAction = UIAlertAction(title: "Edit Shipment", style: .default)
        { (action) in
            //Handle Edit Shipement Action
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let editBarcodeViewController = storyBoard.instantiateViewController(withIdentifier: EditTrackingNumberViewController.storyBoardID) as! EditTrackingNumberViewController
            editBarcodeViewController.passedPackage = self.passedPackage
            
            self.navigationController?.pushViewController(editBarcodeViewController, animated: true)
        }
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        
        
        if passedPackage?.delivered == true
        {
            
        }
        else
        {
            let logoutAction2 = UIAlertAction(title: "Mark Delivered", style: .default)
            { (action) in
                // handle case of user logging out
                self.passedPackage?.delivered = true
            }
            // add the logout action to the alert controller
            alertController.addAction(logoutAction2)
        }
        
      
        
        
        
//        let logoutAction3 = UIAlertAction(title: "Delete", style: .destructive)
//        { [self] (action) in
//            // Delete Package
//
//            self.navigationController?.popViewController(animated: true)
//            let copy = passedPackage
//            CoreDataManager.sharedManager.delete(person: copy!)
//
//
//        }
//        // add the logout action to the alert controller
//        alertController.addAction(logoutAction3)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
        {
            // optional code for what happens after the alert controller has finished presenting
        }
        
    }

}

//MARK: - View Did Load, Appear, Disappear and Appear Functions
extension PackageViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initialSetup() //These items can only be populated after the view has loaded
        lastLocation = (passedPackage?.lastLocation)
        
       
       
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        if shouldDelete
        {
            CoreDataManager.sharedManager.delete(person:self.passedPackage!)
        }
    }

    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true // Hides the Navigation Bar
    }
    

}


 
