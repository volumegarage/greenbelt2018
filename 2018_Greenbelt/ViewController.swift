//
//  ViewController.swift
//  2018_Greenbelt
//
//  Created by David Cate on 2/1/18.
//  Copyright © 2018 David Cate. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let greenbeltLogo = UIImageView()
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "3d08d5a0bbecd09a6d7dfe700c81e14f"
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var cityLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        greenbeltLogo.frame = CGRect(x: 120, y: -200, width: 190, height: 141)
        greenbeltLogo.contentMode = .scaleAspectFill
        greenbeltLogo.image = #imageLiteral(resourceName: "greenbeltlogo.png")
        
        view.addSubview(greenbeltLogo)
        
        self.view = view
        
        siteLaunch()
        
        
        //TODO:Set up the location manager here.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        
    }
    
    
    //MARK: - Site Launch Method Animations
    /***************************************************************/
    
    @objc func siteLaunch() {
        
        let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.7) {
            
            self.greenbeltLogo.frame = CGRect(x: 120, y: 140, width: 190, height: 141)
            
        }
        animator.startAnimation(afterDelay: 1)
    }
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
        }
        
    }
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    
    
    //Write the didFailWithError method here:
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

