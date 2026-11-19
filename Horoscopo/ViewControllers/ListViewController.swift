//
//  ViewController.swift
//  Horoscopo
//
//  Created by Turno Mananas on 18/11/2026.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    // MARK: - Propiedades
    var horoscopeList:[Horoscope] = Horoscope.horoscopeList
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //crear con codigo un buscador en ios
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        tableView.dataSource = self
        
    }
    // MARK: - DataSource TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Tienen tanta filas como horoscopos haya no usaremos secciones
        return horoscopeList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horoscope Cell", for: indexPath) as! HoroscopeViewCell
        let horoscope = horoscopeList[indexPath.row]
        cell.render(with: horoscope)
        return cell
    }
    // MARK: - Delegate SearchBar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = searchBar.text ?? ""
        horoscopeList = Horoscope.horoscopeList.filter{ it in
            //si no le pones el it o cualquier como lo llames puedes colocarlo sin nada y llamar a cada uno com   $0
            it.name.lowercased().contains(query.lowercased()) ||
            it.dates.lowercased().contains(query.lowercased())
        }
        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            horoscopeList = Horoscope.horoscopeList
        }else{
            horoscopeList = Horoscope.horoscopeList.filter{ it in
                it.name.lowercased().contains(searchText.lowercased()) ||
                it.dates.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        horoscopeList = Horoscope.horoscopeList
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let horoscope = horoscopeList[indexPath.row]
        detailVC.horoscope = horoscope
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

