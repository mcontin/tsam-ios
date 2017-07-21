//
//  ViewController.swift
//  LessonLocation
//
//  Created by Mattia Contin  on 09/06/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    static let kNotificationId = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        let content = UNMutableNotificationContent()
        content.title = "Titolo notifica"
        content.subtitle = "Subtitle"
        content.body = "Body of the notificaaaa"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5.0, repeats: false)
        let request = UNNotificationRequest(identifier: ViewController.kNotificationId, content: content, trigger: trigger)
    
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.mapView.showsUserLocation = true
        }
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == ViewController.kNotificationId {
            completionHandler([.alert, .sound, .badge])
        }
    }
}
