//
//  AddTrackingNumberVC - UITextField.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation
import UIKit

//MARK: - User Input Validation and Textfiled Fundtion
extension AddTrakingNumberViewController: UITextFieldDelegate
{
    @objc func textFieldDidChange(_ textField: UITextField)
    {
//        if (trackingNumberLabel.text!.count == 0) || (packageDescriptionLabel.text!.count == 0) ||  (carrierNameLabel.text!.count == 0)
//        {
//            disableButton()
//        }
//        else
//        {
//            enableButton()
//        }
//
        
        
        if (trackingNumberLabel.text!.isEmpty ) || (packageDescriptionLabel.text!.isEmpty) ||  (carrierNameLabel.text!.isEmpty)
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
