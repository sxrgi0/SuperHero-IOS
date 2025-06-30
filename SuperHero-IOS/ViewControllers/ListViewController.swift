//
//  ViewController.swift
//  SuperHero-IOS
//
//  Created by Tardes on 24/6/25.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var superheroList: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        searchSuperheroByName(query: "a")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSuperheroByName(query: searchBar.text!)
    }
    
    func searchSuperheroByName(query: String) {
        Task {
            superheroList = await SuperheroProvider.findSuperheroes(query: query)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        self.navigationItem.hidesSearchBarWhenScrolling = true
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        detailViewController.superhero = superheroList[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

