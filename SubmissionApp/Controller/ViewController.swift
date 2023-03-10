//
//  ViewController.swift
//  SubmissionApp
//
//  Created by Andrian Oktiawan on 18/01/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var listTableView: UITableView!
    
    var myPlacesData: [Places]? {
        didSet{
            listTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let apiService = ApiService()
        
        apiService.fetchData { (places) in
            DispatchQueue.main.async { [self] in
               myPlacesData = places.places
            }
        }
        
        listTableView.dataSource = self
        listTableView.delegate = self
        
        listTableView.register(
          UINib(nibName: "TourismTableViewCell", bundle: nil),
          forCellReuseIdentifier: "TourismCell"
        )
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPlacesData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TourismCell") as? TourismTableViewCell else {
            return UITableViewCell()
        }
        
        let detailWisata = myPlacesData?[indexPath.row]
        
        cell.tourismImageView.loadFrom(URLAddress: detailWisata?.image ?? "")
        cell.tourismImageView.layer.cornerRadius = 10
        cell.tourismLabel.text = detailWisata?.name
        cell.tourismLabelAddress.text = detailWisata?.address
        cell.tourismLabelLike.text = String(detailWisata?.like ?? 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:"ToDetail" , sender: myPlacesData?[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetail" {
            if let detaiViewController = segue.destination as? DetailViewController {
                detaiViewController.tourism = sender as? Places
            }
        }
    }
}



