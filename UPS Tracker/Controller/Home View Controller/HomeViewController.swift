//
//  ViewController.swift
//  Track It
//
//  Created by Adebayo Sotannde on 1/15/22.
//
import UIKit
import CoreData

//MARK: - Main Class
class HomeViewController: UIViewController
{
    
    //MARK: - New Core Data Model
   
    var refreshCounter = 5
    
    var rerivedData = [FireBasePackageObject]()
    
    var userJustSignedIn = false
    var counter = 0
    //MARK: - Constants and Variables
    static var storyBoardID = "HomeViewController"
    
    let refreshControl = UIRefreshControl() //Refresh Control

    public var isSideMenuShown:Bool = false //Used to determine if side menu is shown
   
    
    
    //MARK: - Package Object ----------------------------   Begin
    var packages = [PackageObject]() //Pacakge Object Array
    var filteredPackages: [PackageObject] = [] //Filtered Package Object Array
    
    //MARK: - Package Object ----------------------------   END
    
    
    
    //MARK: - Search Bar ----------------------------   Begin
    let searchController = UISearchController(searchResultsController: nil)
    //Used to check if there is text inside the search bar
    var isSearchBarEmpty: Bool
    {
      return searchController.searchBar.text?.isEmpty ?? true  // Checks if theres text inside search bar
    }
    //Used to check if there is filterning is active. ie Text in the se
    var isFiltering: Bool
    {
      return searchController.isActive && !isSearchBarEmpty
    }
    //MARK: - Search Bar ----------------------------   END
    
    
    //MARK: - Timer ----------------------------   Begin
    var timer = Timer()
    //MARK: - Timer ----------------------------   END
    
    
  var pauseRefresh = false
    
    
    //IBOUTLETS
    @IBOutlet weak var packageTableView: UITableView!
    @IBOutlet weak var navigationTitle: UINavigationItem!


    


   
    
    @IBAction func cameraButtonPressed(_ sender: Any)
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addBarcodeViewController = storyBoard.instantiateViewController(withIdentifier: AddTrakingNumberViewController.storyBoardID) as! AddTrakingNumberViewController
        addBarcodeViewController.modalPresentationStyle = .fullScreen
        addBarcodeViewController.launchBarcodeViewController = true
        navigationController?.pushViewController(addBarcodeViewController, animated: true)
    }
    
    @IBAction func addBarcodeButtonPressed(_ sender: Any)
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addBarcodeViewController = storyBoard.instantiateViewController(withIdentifier: AddTrakingNumberViewController.storyBoardID) as! AddTrakingNumberViewController
        addBarcodeViewController.modalPresentationStyle = .popover
        navigationController?.pushViewController(addBarcodeViewController, animated: true)
    }

}


