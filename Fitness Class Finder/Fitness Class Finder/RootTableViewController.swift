//
//  RootTableViewController.swift
//
//
//  Created by hadeel shqair on 11/22/2024.
//
// This App is developed as an educational project
import Foundation
import UIKit
class RootTableViewController: UITableViewController {
    var FCFObjectArray = [FitnessClass]()
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return FCFObjectArray.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let fc = FCFObjectArray[indexPath.row]
        cell.textLabel?.text = fc.ClassName
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.detailTextLabel?.text = fc.ClassLocation
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.imageView?.image = UIImage(named: fc.ClassImage)
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.layer.cornerRadius = 10
        cell.imageView?.layer.borderWidth = 2
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowClassDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let fc = FCFObjectArray[indexPath.row]
                let destinationVC = segue.destination as! ViewController
                destinationVC.randomFCF = fc
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopulateFCObjects()
    }
    
    
    
    
    func PopulateFCObjects() {
        let fc1 = FitnessClass()
        fc1.ClassName = "Pilates House"
        fc1.ClassDescription = "At Pilates House, our studio is built on a boutique model of reformer and infrared mat pilates training. Therefore, our Reformer and Hot classes have uniquely been designed to complement each other, thus providing an enhanced cross-training experience for the individual."
        fc1.ClassLength = "60 minutes"
        fc1.ClassLocation = "Baltimore, MD"
        fc1.Classtypename = "Pilates Studio"
        fc1.ClassIntensity = "Low"
        fc1.ClassImage = "Pilates.jpeg"
        fc1.ClassWebSite = "https://classpass.com/studios/pilates-house-baltimore"
        fc1.Mood = "Core power time 💪"
        fc1.Rating = "4.8"
        FCFObjectArray.append(fc1)
       
        let fc2 = FitnessClass()
        fc2.ClassName = "Zoom Cville"
        fc2.ClassDescription = "Zoom Charlottesville is the only boutique fitness studio in the area offering cardio, sculpt-barre, and strength training-and boxing-all under one roof."
        fc2.ClassLength = "45 minutes"
        fc2.ClassLocation = "Charlottesville, VA"
        fc2.Classtypename = "Cycle Studio"
        fc2.ClassIntensity = "High"
        fc2.ClassImage = "ZoomCville.jpeg"
        fc2.ClassWebSite = "https://classpass.com/studios/zoom-cville-charlottesville"
        fc2.Mood = "Ready to crush it! 🔥"
        fc2.Rating = "4.2"
        FCFObjectArray.append(fc2)
        
        let fc3 = FitnessClass()
        fc3.ClassName = "F45 Training"
        fc3.ClassDescription = "F45 Training is a revolutionary training system that blends high-intensity interval training with technology to provide an unparalleled cardiovascular workout in just 45 minutes. The purpose of workouts is to allow people to work out more than once a week."
        fc3.ClassLength = "45 minutes"
        fc3.ClassLocation = "Richmond, VA"
        fc3.Classtypename = "Revolutionary fitness"
        fc3.ClassIntensity = "High"
        fc3.ClassImage = "F45Training.jpeg"
        fc3.ClassWebSite = "https://classpass.com/studios/f45-training--fan-district-va-richmond"
        fc3.Mood = "Time to sweat it out! 💦"
        fc3.Rating = "3.8"
        FCFObjectArray.append(fc3)
        
        let fc4 = FitnessClass()
        fc4.ClassName = "Humble Haven Yoga"
        fc4.ClassDescription = "Humble Haven Yoga is the first Hot Power yoga studio in Richmond. Humble Haven now offers well over 60 classes per week in both heated and unheated studio spaces."
        fc4.ClassLength = "60 minutes"
        fc4.ClassLocation = "Richmond, VA"
        fc4.Classtypename = "Hot Power yoga studio"
        fc4.ClassIntensity = "Medium"
        fc4.ClassImage = "HumbleHavenYoga.jpeg"
        fc4.ClassWebSite = "https://classpass.com/studios/humble-haven-yoga-glenside-richmond?reviewsPage=6"
        fc4.Mood = "Balanced workout 🧘‍♀️"
        fc4.Rating = "4.5"
        FCFObjectArray.append(fc4)
        
        let fc5 = FitnessClass()
        fc5.ClassName = "Hour Cycle Studio"
        fc5.ClassDescription = "Hour Cycle gives the indoor cycling experience a dope (AF) twist. They turn down the main lights for their 45 or 60 minute studio sessions and turn up the music, including Hip-hop, Trap, Crunk, Reggae, Soca, Afrobeat, and Ride."
        fc5.ClassLength = "45 or 60 minutes"
        fc5.ClassLocation = "Richmond, VA"
        fc5.Classtypename = "Cycle Studio"
        fc5.ClassIntensity = "High"
        fc5.ClassImage = "cycleClass.jpeg"
        fc5.ClassWebSite = "https://classpass.com/studios/hour-cycle-studio-richmond?reviewsPage=9"
        fc5.Mood = "High energy vibes ⚡️"
        fc5.Rating = "4.2"
        FCFObjectArray.append(fc5)
    }
    
}

