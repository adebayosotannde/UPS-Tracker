//
//  HomeViewController - Seach Bar.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation
import UIKit

//MARK: - UISEARCH BAR
extension HomeViewController: UISearchResultsUpdating,UISearchBarDelegate
{
    //Called to update the search results for a specifed search bar
    func updateSearchResults(for searchController: UISearchController)
    {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)  //Filter serch bar with the text specified (searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String,  status: PackageStatus.Category? = nil)
    {
      filteredPackages = packages.filter
        {
            (package: PackageObject) -> Bool in
            //filter by tracking number and
            let trackingNumberCheck = package.trackingNumber!.lowercased().contains(searchText.lowercased())
            let descriptionCheck = package.packageDescription!.lowercased().contains(searchText.lowercased())
            let descriptionCarrier  = package.packageCarrier!.lowercased().contains(searchText.lowercased())
            //return package.packageDescription!.lowercased().contains(searchText.lowercased())
                //return package.trackingNumber!.lowercased().contains(searchText.lowercased())
            return trackingNumberCheck || descriptionCheck || descriptionCarrier
      }
        packageTableView.reloadData()
    }
    
    //MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int)
    {
          let packageStatus = PackageStatus.Category(rawValue: searchBar.scopeButtonTitles![selectedScope])
          filterContentForSearchText(searchBar.text!, status: packageStatus)
    }
}

