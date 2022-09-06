//
//  HomeViewController - LifeCycle.swift
//  Track It
//
//  Created by Adebayo Sotannde on 4/9/22.
//

import Foundation

//MARK: - LifeCycle Functions and Setup
extension HomeViewController
{
    override func viewWillAppear(_ animated: Bool)
    {
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
       
        let timer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
        
    @objc func update()
    {
        if counter < 5
        {
            refreshDataForAllPackages()
             counter = counter + 1
        }
       
    }
}
