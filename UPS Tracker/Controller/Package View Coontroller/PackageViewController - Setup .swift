//
//  PackageViewController - .swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation
import UIKit
import MapKit

//MARK: - Setup Function
extension PackageViewController
{
    func initialSetup()
    {
     registerNotificationCenter() //Notification Center
     setupRefreshControl()  //Refresh Control
     setUpTableView() //Table View Setuo
     populatePageWithObject()
        websiteLogo.blink()
        
    
    }
    
    
    func setupRefreshControl()
    {
        registerRefreshControl()
    }
    
    ///- Function allows the view controller to respond to notification requests.
    func registerNotificationCenter()
    {
    //Obsereves the Notification
    NotificationCenter.default.addObserver(self, selector: #selector(doWhenNotified(_:)), name: Notification.Name(StringLiteral.notificationKey), object: nil)
    }
    
    
    func setUpTableView()
    {
        registerTableViewCells()
        configureTableView()
    }
    
   
    
}


//MARK: - Populate View Controller from Package Object
extension PackageViewController
{
    func updatePageWithObject()
    {
        setupTrargetforLabel()
        setupNavigationLogo()
        setLogoLabel()
        setTrackingLable()
        setLastupdated()
       // setMapViewLocation()  //Removed
        setDeliveryDate()
        setTransitStatus()
        setErrorMessageView() //Hides text that indicates to the user the tracking number is invalid
        
        packgeTableViewController.reloadData() //Additional
    }
    func populatePageWithObject()
    {
        setupTrargetforLabel()
        setupNavigationLogo()
        setLogoLabel()
        setTrackingLable()
        setLastupdated()
        setMapViewLocation()
        setDeliveryDate()
        setTransitStatus()
        setErrorMessageView() //Hides text that indicates to the user the tracking number is invalid
    }
    
    func setupTrargetforLabel()
    {
        addTargetforCarrierImage()
        addTargetforCarrierLabel()
    }
    
    func setLogoLabel()
    {
        websiteLogo.image = UIImage(named: (passedPackage?.carrierLogoName?.lowercased())!) //sets the image that users can click on to take them to the carriers webite.
    }
    
    func setupNavigationLogo()
    {
        
       
       
    navigationBarLogo.image =  UIImage(named: (passedPackage?.carrierLogoName?.lowercased())!) //populates carrier image in the navigation bar
    }
    
    func setTrackingLable()
    {
        trackingNumberLabel.text = passedPackage?.trackingNumber //populates the tracking numnber in the navigation bar
    }
    
    func setLastupdated()
    {
        lastUpdated.text = passedPackage?.lastUpdated
    }
    
    func setMapViewLocation()
    {
        var address = passedPackage?.lastLocation
        let geocoder = CLGeocoder()
        
        if address == nil
        {
            address = "NY, NY"
        }
            geocoder.geocodeAddressString(address!)
            {
                placemarks, error in
                let placemark = placemarks?.first
               var lat = placemark?.location?.coordinate.latitude
               var lon = placemark?.location?.coordinate.longitude
             
                if lat == nil || lon == nil
                {
                    lat = 39.999733
                    lon = -98.6785034
                }
                
               let center = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
                let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                self.mapView.setRegion(region, animated: true)
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
                self.mapView.addAnnotation(annotation)
            }
    }
    
    func setDeliveryDate()
    {
        let data: DataObjectManager = DataObjectManager(package: passedPackage!)
        estimatedDeliverDateLabel.text = data.isThereAnDeliveryDateAvailabe()
    }
    
    func setTransitStatus()
    {
        let data: DataObjectManager = DataObjectManager(package: passedPackage!)
        currentDescription.adjustsFontSizeToFitWidth =  true
        currentDescription.minimumScaleFactor = 0.2
        
        if passedPackage?.isValidTrackingNumber == false
        {
            currentDescription.text = "Awaiting updates from the carrier"
            longerDescriptionLabel.text = "Please ensure that the tracking number is accutate. In the mean while we will periodically check for updates from the carrier. Youll be notifed of any changes."
            longDescriptionView.backgroundColor = .systemRed
        }
        else
        {
            currentDescription.text = data.getMostRecentStatusTypeDescriptionReadableText()
            
         
                currentImage.image = UIImage(systemName: data.getBestImage())
                longDescriptionView.backgroundColor = data.getDescriptionBackgroundColor()
                
 
        }
        
    }
    
    func setErrorMessageView()
    {
        if passedPackage?.isValidTrackingNumber == false
        {
            
        }
        else
        {
            longDescriptiopnlayoutConstraint.constant = 0 //Hides it essentially.
        }
    }
    
    

}
