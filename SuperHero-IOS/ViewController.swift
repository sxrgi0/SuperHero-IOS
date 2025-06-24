//
//  ViewController.swift
//  SuperHero-IOS
//
//  Created by Tardes on 24/6/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var superheroList: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        Task {
            superheroList = await SuperheroProvider.findSuperheroes(query: "Super")
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperheroCell", for: indexPath) as! SuperheroViewCell
        let superhero = superheroList[indexPath.row]
        cell.render(with: superhero)
        return cell
    }
    
    
}

