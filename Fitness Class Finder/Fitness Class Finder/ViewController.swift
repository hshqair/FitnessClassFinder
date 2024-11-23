//
//  ViewController.swift
//  Fitness Class Finder
//
//  Created by hadeel shqair on 10/22/24.
//
// This App is developed as an educational project

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ImgClassImage: UIImageView!
    
    @IBOutlet weak var lblLength: UILabel!
    
    @IBOutlet weak var txtDescription: UITextView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblType: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblIntensity: UILabel!
    
    @IBOutlet weak var scAreaOne: UIScrollView!
    
    @IBOutlet weak var swFav: UISwitch!
    
    @IBOutlet weak var lblColor: UILabel!
    
    @IBOutlet weak var lblMood: UILabel!
    
    @IBOutlet weak var lblRate: UILabel!
    
    
    var FCFObjectArray = [FitnessClass]()
    var randomFCF = FitnessClass()
    
    
    var mySoundFile: AVAudioPlayer!
    // Allocate mem for the sound varaible and initialize the variable - written in the viewDidLoad Function
    // call the Play() / Stop() / pause() / Rewind() / forward()
    // written in the SetLables Function
    
    
    
    
    @IBOutlet weak var lblCOFD: UILabel!
    
    let classes = ["Pilates House", "Zoom Cville", "F45 Training", "Humble Haven Yoga", "Hour Cycle Studio"]
        
        let classOfTheDayLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 26)
            return label
        }()
        
        
    
    

    
    @IBAction func swFavValChanged(_ sender: Any) {
        if (swFav.isOn) {
            UserDefaults.standard.set(lblName.text, forKey: "favorite")
        }
        else {
            UserDefaults.standard.set("", forKey: "favorite")
        }
        
    }
    
    @IBAction func btnNext(_ sender: Any) {
        setlabels()
    }
    

    
    @IBAction func btnWebSite(_ sender: Any) {
        let browserApp = UIApplication.shared
        let url = URL(string: randomFCF.ClassWebSite)
        browserApp.open(url!)
        
    }
    
   
    
    func setlabels() {
        //randomFCF = FCFObjectArray.randomElement()!
        lblName.text = randomFCF.ClassName
        txtDescription.text = randomFCF.ClassDescription
        lblLength.text = randomFCF.ClassLength
        lblType.text = randomFCF.Classtypename
        lblLocation.text = randomFCF.ClassLocation
        lblIntensity.text = randomFCF.ClassIntensity
        ImgClassImage.image = UIImage(named: randomFCF.ClassImage)
        lblMood.text = randomFCF.Mood
        lblRate.text = randomFCF.Rating
        lblCOFD.text = randomFCF.ClassName
    
       
        let fav = UserDefaults.standard.string(forKey: "favorite")
        swFav.isOn = (randomFCF.ClassName == fav )
        
        let ratingLabel = UILabel()
        ratingLabel.text = "Average Rating: 4.5"

        switch (randomFCF.ClassIntensity) {
        case "High":
            lblColor.backgroundColor = UIColor(red:241/255, green:92/255, blue:12/255, alpha: 1)
            break
        case "Medium":
            lblColor.backgroundColor = UIColor(red:241/255, green:222/255, blue:24/255, alpha: 1)
            break
        case "Low":
            lblColor.backgroundColor = UIColor(red:46/255, green:241/255, blue:25/255, alpha: 1)
            break
        default:
            lblColor.backgroundColor = UIColor(red:182/255, green:219/255, blue:255/255, alpha: 1)
        }
        
    
        
        //decorate the controls
        txtDescription.layer.cornerRadius = 15
        txtDescription.layer.borderWidth = 1
        txtDescription.layer.borderColor = UIColor.darkGray.cgColor
        
        ImgClassImage.layer.cornerRadius = 15
        ImgClassImage.layer.borderWidth = 1
        ImgClassImage.layer.borderColor = UIColor.darkGray.cgColor
        
        scAreaOne.layer.cornerRadius = 15
        scAreaOne.layer.borderWidth = 1
        scAreaOne.layer.borderColor = UIColor.darkGray.cgColor
       
        mySoundFile.play()
        
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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        ImgClassImage.alpha = 0
        lblName.alpha = 0
        txtDescription.alpha = 0
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
      
        UIView.animate(withDuration: 3, animations: {
            self.ImgClassImage.alpha = 1
            self.lblName.alpha = 1
            self.txtDescription.alpha = 1
        })
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        swFav.isOn = false
        PopulateFCObjects() // initilize the objects
        
        
        func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(classOfTheDayLabel)
            let ClassOfTheDay = classes.randomElement()!
            classOfTheDayLabel.text = "Today's featured class: \(ClassOfTheDay)"
        }
        
        let soundUrl = URL(fileURLWithPath: Bundle.main.path(forResource:"blocker_hit", ofType:"wav")!)
        mySoundFile = try? AVAudioPlayer(contentsOf: soundUrl)
        
        setlabels() // set initial value on the labels
        
        // Do any additional setup after loading the view.
    }

        
    
}

