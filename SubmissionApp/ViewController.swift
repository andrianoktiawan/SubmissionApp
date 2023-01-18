//
//  ViewController.swift
//  SubmissionApp
//
//  Created by Andrian Oktiawan on 18/01/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.dataSource = self
        listTableView.delegate = self
        
        listTableView.register(
          UINib(nibName: "TourismTableViewCell", bundle: nil), // Isi dengan nama file XIB
          forCellReuseIdentifier: "TourismCell" // Isi dengan Identifier Cell yang telah ditentukan
        )
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyTourismData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TourismCell") as? TourismTableViewCell else {
            return UITableViewCell()
        }
        
        let detailWisata = dummyTourismData[indexPath.row]
        
        cell.tourismLabel.text = detailWisata.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:"ToDetail" , sender: dummyTourismData[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetail" {
            if let detaiViewController = segue.destination as? DetailViewController {
                detaiViewController.tourism = sender as? TourismModel
            }
        }
    }
}

