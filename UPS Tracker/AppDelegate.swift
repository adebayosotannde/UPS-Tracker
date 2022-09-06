//
//  AppDelegate.swift
//  UPS Tracker
//
//  Created by Adebayo Sotannde on 9/4/22.
//

import UIKit

import CoreData
import Siren


@main
class AppDelegate: UIResponder, UIApplicationDelegate
{

    

    var orientationLock = UIInterfaceOrientationMask .portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        
        //MARK: - Configure Firebase
        
   
        
        //MARK: - Siren
        Siren.shared.wail() //Siren import statement.
        //Update Message Presented to User.
        Siren.shared.presentationManager = PresentationManager(alertTintColor: .systemBlue, appName: "UPS Tracker", alertTitle: "A New Version is Available", alertMessage: "A new version of the app is available. Please update as soon as possible. Thank you", updateButtonTitle: "Update", nextTimeButtonTitle: "Not Now", skipButtonTitle: "Skip this Version", forceLanguageLocalization: .none)
       
        Siren.shared.rulesManager = RulesManager(globalRules: .annoying, showAlertAfterCurrentVersionHasBeenReleasedForDays: 1) //Waits 1 days after update release to upgrade user.
        
        //MARK: - Authorize User Notifications
        authorizeUserNotifications()
        
        //Disable Firebase analytics
        
       
        
        return true
    }
    
    // AUTHORIZE NOIFICATION
   func authorizeUserNotifications() {
       
       print("AppDelegate ", #function)

       let center = UNUserNotificationCenter.current()
       
       center.requestAuthorization(options: [.alert, .badge, .sound])
       {   // start closure
           (granted, error) in
           if granted {
               print(#function, "Authorized for User Notifications")
           } else {
               print("Not Authorized for User Notifications")
           }
       }   // end closure
   }
    
    
    
    //USED TO SET ORIENTATION THAT ARE ALLOWED. NOTE: This applies to all screens
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
    {
        
//        override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//
//            AppUtility.lockOrientation(.portrait)
//            // Or to rotate and lock
//            // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
//
//        }
//
//        override func viewWillDisappear(_ animated: Bool) {
//            super.viewWillDisappear(animated)
//
//            // Don't forget to reset when view is being removed
//            AppUtility.lockOrientation(.all)
//        }
        
        
        
        
            return self.orientationLock
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer =
    {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "UPS_Tracker")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    
    

    // MARK: - Core Data Saving support

    func saveContext ()
    {
        let context = persistentContainer.viewContext
        if context.hasChanges
        {
            do
            {
                try context.save()
            } catch
            {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}



