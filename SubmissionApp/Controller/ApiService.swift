//
//  ApiService.swift
//  SubmissionApp
//
//  Created by Andrian Oktiawan on 18/01/23.
//

import UIKit

struct ApiService {
    
    func fetchData(completion: @escaping(PlaceModel) -> Void) {
        guard let url = URL(string: "https://tourism-api.dicoding.dev/list") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url){
            (data, response, error )in
            
            if error != nil {
                print("Error fetching data \(error!.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(PlaceModel.self, from: jsonData)
                completion(decodedData)
            } catch {
                print("Error decoding data : \(error)")
            }
        }
        
        dataTask.resume()
    }
    
}

extension UIImageView {
    
    func loadFrom(URLAddress: String) {
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        activityIndicator.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        self.addSubview(activityIndicator)
        contentMode = .scaleToFill
        image = nil
        
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("error fetching image \(error!.localizedDescription)")
            }
            
            guard let imageData = data else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
                activityIndicator.stopAnimating()
            }
        }
        dataTask.resume()
    }
}
