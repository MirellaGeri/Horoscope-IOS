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
    let elements = ["Fuego","Tierra","Aire","Agua"]
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
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "MysticGold")!,
            .strokeColor: UIColor(named: "MysticPurple")!,
            .strokeWidth: -3.0,
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        
        tableView.dataSource = self
        
    }
    /* Otra manera de Onresume
    override func viewDidAppear(_ animated: Bool) {
        //EL efecto es ver que hay un cambio como un saltito
        super.viewDidAppear(animated)
        tableView.reloadData()
    }*/
    //Similar a OnResume
    override func viewWillAppear(_ animated: Bool) {
        //EL efecto es que ya se cambio y solo visualizas el cambio ya hecho sin ver el saltito
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - DataSource TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return elements.count
    }
    func horoscopeForIndexPath(_ indexPath: IndexPath) -> Horoscope{
        let element = elements[indexPath.section]
        let signxElementList = horoscopeList.filter{
            $0.element == element
        }
        return signxElementList[indexPath.row]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*//Tienen tanta filas como horoscopos haya no usaremos secciones     ANTES
        return horoscopeList.count*/
        let element = elements[section]
        return horoscopeList.filter{
            $0.element == element
        }.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return elements[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horoscope Cell", for: indexPath) as! HoroscopeViewCell
        let horoscope = horoscopeForIndexPath(indexPath)
        cell.render(with: horoscope)
        return cell
    }
    // MARK: - Delegate SearchBar
    /*func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = searchBar.text ?? ""
        horoscopeList = Horoscope.horoscopeList.filter{ it in
            //si no le pones el it o cualquier como lo llames puedes llamarlo a cada uno com   $0 ejemplo arriba
            it.name.lowercased().contains(query.lowercased()) ||
            it.dates.lowercased().contains(query.lowercased())
        }
        tableView.reloadData()
    }*/
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
        let horoscope = horoscopeForIndexPath(indexPath)
        detailVC.horoscope = horoscope
        tableView.deselectRow(at: indexPath, animated: false)
    }
    // MARK: -
}

