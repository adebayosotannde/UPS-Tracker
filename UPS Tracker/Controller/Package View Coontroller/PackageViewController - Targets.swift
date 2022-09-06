//
//  PackageViewController - Targets.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation
import UIKit

//MARK: - User Input Validation and Textfiled Fundtion
extension PackageViewController
{
   
    func addTargetforCarrierImage()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PackageViewController.imageTapped))

            // add it to the image view;
        websiteLogo.addGestureRecognizer(tapGesture)
            // make sure imageView can be interacted with by user
        websiteLogo.isUserInteractionEnabled = true
        
       
        
    }
    
    func addTargetforCarrierLabel()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PackageViewController.LabelTapped))

        //Target for label.
        trackingNumberLabel.addGestureRecognizer(tapGesture)
        trackingNumberLabel.isUserInteractionEnabled = true
        
        
    }
    
    @objc func imageTapped()
    {
        WebSiteManager.sharedManager.launchSite(packageDetail: passedPackage!)
    }
    
    @objc func LabelTapped()
    {
        UIPasteboard.general.string = passedPackage?.trackingNumber
        trackingNumberLabel.textColor = UIColor.gray
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1)
        {
            // your code here
            self.trackingNumberLabel.textColor = UIColor.black
        }
        
    }
}

