//
//  AddTrackingNumberVC - LifeCycle.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation

//MARK: - View Did Functions
extension AddTrakingNumberViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        if (launchBarcodeViewController == true)
        {
            self.performSegue(withIdentifier: StringLiteral.barcodeScanner, sender: self)
            launchBarcodeViewController = false
        }
    }

}
