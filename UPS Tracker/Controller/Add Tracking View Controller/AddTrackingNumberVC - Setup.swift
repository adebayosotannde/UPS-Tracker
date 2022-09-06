//
//  AddTrackingNumberVC - Setup.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation

//MARK: - Setup and UI Functions
extension AddTrakingNumberViewController
{
    func setup()
    {
        //UIVIEW
        registerTargetForLabel()
        registerDelgateForLabel()
        barcodeButton.blink()//Makes the Barcode Button Blink to grab users attention
        registerNotificationCenter()
        self.dismissKeyboard() //Dismiss keyboard when not inside the UITextfield
    }
    
    func registerTargetForLabel()
    {
        trackingNumberLabel.addTarget(self, action: #selector(AddTrakingNumberViewController.textFieldDidChange(_:)), for: .editingChanged)
        packageDescriptionLabel.addTarget(self, action: #selector(AddTrakingNumberViewController.textFieldDidChange(_:)), for: .editingChanged)
        carrierNameLabel.addTarget(self, action: #selector(AddTrakingNumberViewController.textFieldDidChange(_:)), for: .editingChanged)
        disableButton() //disables the button to prevent blank data from being entered
    }
    
    func registerDelgateForLabel()
    {
        self.carrierNameLabel.delegate = self
    }
    
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
}
