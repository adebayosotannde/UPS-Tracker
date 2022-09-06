//
//  Setup - Home View Controller.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation
import UIKit

//MARK: - Setup and UI Functions
extension HomeViewController
{
     func setup()
     {
         
         setUpNavigationTitle()
         setUpTableView()
         setupNotificationCenter()
         setupRefreshControl()
         setupSearchBar()
         self.dismissKeyboard() //Dismiss keyboard when not inside the UITextfield
         updateUI()
        
      
         
     }
    
    //Navigation Bar Setup
    func setUpNavigationTitle()
    {
        navigationTitle.title = StringLiteral.homeViewControllerTitleName //Sets the Title for the Navigation Bar
    }
    
    //Table View Setup
    func setUpTableView()
    {
        //RegisterTableViewCells
        let textFieldCell = UINib(nibName: PackageTableViewCell.classIdentifier,bundle: nil)
        self.packageTableView.register(textFieldCell,forCellReuseIdentifier: PackageTableViewCell.cellIdentifier)
        
        
        //Alter the appearance of the Table View
        packageTableView.showsVerticalScrollIndicator = false
        packageTableView.separatorStyle = .none  //Hides the lines
    }
    
    //Registers the notficiation center
    func setupNotificationCenter()
    {
        registerNotificationCenter() //Notification Center Registration
    }
    
    //Refresh Control Setup
    func setupRefreshControl()
    {
        registerRefreshControl() //Register Refresh Control
    }
    
    //Search Bar Setup
    func setupSearchBar()
    {
        searchController.searchResultsUpdater = self //Step 1
        searchController.obscuresBackgroundDuringPresentation = false //Step 2
        searchController.searchBar.placeholder = "carrier, tracking number & description" //Step 3
        navigationItem.searchController = searchController //Step 4
        definesPresentationContext = true // Step 5
    }
    
    public func updateUI()
    {
        packages = CoreDataManager.sharedManager.loadTrackingNumber() //Retrive Package Objects Array
        self.packageTableView.reloadData()
        hideTableViewIfThereAreNoPackages()
        
    }
    
    //Hides the Table View If there are no Packages in the Container.
    func hideTableViewIfThereAreNoPackages()
    {
        if(packages.count == 0 )
          {
              packageTableView.isHidden = true
            navigationItem.searchController = nil //Hides the search bar
          }
            else
            {
               
                    self.packageTableView.isHidden = false
                    self.navigationItem.searchController = searchController //unhides the search bar
                
              
            }
    }
}
