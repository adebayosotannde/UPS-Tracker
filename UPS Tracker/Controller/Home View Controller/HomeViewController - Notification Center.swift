//
//  HomeViewController - Notification Center.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation


//MARK: - Notification Canter
extension HomeViewController
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
            if (dict[StringLiteral.updateHomeViewData] as? String) != nil
            {
                updateUI()
            }
    
        
    
        }
    }
    
}
