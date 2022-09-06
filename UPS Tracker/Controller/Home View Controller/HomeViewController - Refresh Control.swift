//
//  HomeViewController - Refresh Control.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation

//MARK: - Refresh Contol
extension HomeViewController
{

    func registerRefreshControl()
    {
        if #available(iOS 10.0, *)
        {
            packageTableView.refreshControl = refreshControl
        } else
        {
            packageTableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "updating...", attributes: nil)
        refreshControl.tintColor = .darkGray
    }
    
    @objc private func refreshData(_ sender: Any)
    {
       
        refreshDataForAllPackages()
        refreshControl.endRefreshing()
    }

   
}
