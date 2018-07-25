//
//  ViewController.swift
//  wingu-ios-sdk-essentials
//
//  Created by JakubMazur on 04/24/2018.
//  Copyright (c) 2018 JakubMazur. All rights reserved.
//

import UIKit
import CoreLocation
import winguSDKEssential

class ViewController: UIViewController {
    
    lazy var winguLocations: WinguLocations = {
        let winguLocations: WinguLocations = WinguLocations.shared
        winguLocations.delegate = self
        return winguLocations
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winguLocations.startRangingBeacons(regions: [], locationManager: nil)
        winguLocations.startMonitorGeofenceLocations()
    }
}

extension ViewController: WinguLocationsDelegate {
    func authorizationStatus(_ authorizationStatus: CLAuthorizationStatus) { }
    
    func winguChannels(_ channels: [Channel]) {
        print(channels)
    }
    
}
