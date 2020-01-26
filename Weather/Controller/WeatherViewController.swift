//
//  ViewController.swift
//  Weather
//
//  Created by Reem Daraghmeh on 1/22/20.
//  Copyright © 2020 Reem Daraghmeh. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properites
    let weatherViewModel: WeatherViewModel = WeatherViewModel()
    let refresher = UIRefreshControl()
    let weatherCellHeight: CGFloat = 160.0
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        refresher.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        weatherViewModel.getCachedWeatherData()
        getDataFromAPI()
        weatherViewModel.onDataDidChange = { [weak self] in
            self?.refresher.endRefreshing()
            self?.reloadData()
        }
    }

    //MARK: FetchData
    func getDataFromAPI(){
        weatherViewModel.weather.removeAll()
        weatherViewModel.getWeatherData(city: .amman)
        weatherViewModel.getWeatherData(city: .aqaba)
        weatherViewModel.getWeatherData(city: .irbid)
    }
    
    @objc func refreshData(){
        refresher.beginRefreshing()
        getDataFromAPI()
    }
    
    // MARK: Configurations
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.addSubview(refresher)
    }
    
    func reloadData(){
        collectionView.reloadData()
    }
}

