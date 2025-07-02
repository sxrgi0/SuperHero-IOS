//
//  DetailViewController.swift
//  SuperHero-IOS
//
//  Created by Tardes on 25/6/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    var superhero: Superhero! //La ! es el late init var de Kotlin

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    
    @IBOutlet weak var intelligenceProgressView: UIProgressView!
    @IBOutlet weak var strengthProgressView: UIProgressView!
    @IBOutlet weak var speedProgressView: UIProgressView!
    @IBOutlet weak var durabilityProgressView: UIProgressView!
    @IBOutlet weak var powerProgressView: UIProgressView!
    @IBOutlet weak var combatProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = superhero.name
        
        avatarImageView.loadFrom(url: superhero.image.url)
        realNameLabel.text = superhero.biography.realName
        publisherLabel.text = superhero.biography.publisher
        placeOfBirthLabel.text = superhero.biography.placeOfBirth
        alignmentLabel.text = superhero.biography.alignment.uppercased()
        alignmentLabel.textColor = UIColor(named: "alignment-\(superhero.biography.alignment)")
        
        intelligenceLabel.text = superhero.powerstats.intelligence
        strengthLabel.text = superhero.powerstats.strength
        speedLabel.text = superhero.powerstats.speed
        durabilityLabel.text = superhero.powerstats.durability
        powerLabel.text = superhero.powerstats.power
        combatLabel.text = superhero.powerstats.combat
        
        intelligenceProgressView.setProgress(Float(Int(superhero.powerstats.intelligence) ?? 0) / 100, animated: true)
        strengthProgressView.setProgress(Float(Int(superhero.powerstats.strength) ?? 0) / 100, animated: true)
        speedProgressView.setProgress(Float(Int(superhero.powerstats.speed) ?? 0) / 100, animated: true)
        durabilityProgressView.setProgress(Float(Int(superhero.powerstats.durability) ?? 0) / 100, animated: true)
        powerProgressView.setProgress(Float(Int(superhero.powerstats.power) ?? 0) / 100, animated: true)
        combatProgressView.setProgress(Float(Int(superhero.powerstats.combat) ?? 0) / 100, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
