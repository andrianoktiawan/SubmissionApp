//
//  DetailViewController.swift
//  SubmissionApp
//
//  Created by Andrian Oktiawan on 18/01/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailImage: UIImageView!
    
    @IBOutlet var detailName: UILabel!
    
    @IBOutlet var detailDescription: UILabel!
    
    @IBOutlet var detailAddress: UILabel!
    
    @IBOutlet var detailLike: UILabel!
    
    var tourism: Places? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = tourism {
            detailImage.loadFrom(URLAddress: result.image)
            detailImage.layer.cornerRadius = 10
            detailName.text = result.name
            detailDescription.text = result.description
            detailAddress.text = result.address
            detailLike.text = String(result.like)
        }
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
