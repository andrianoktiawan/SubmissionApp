//
//  PlaceModel.swift
//  SubmissionApp
//
//  Created by Andrian Oktiawan on 18/01/23.
//

import UIKit

struct PlaceModel: Decodable {
    let error: Bool
    let message: String
    let count: Int
    let places: [Places]
}

struct Places: Decodable {
    let id: Int
    let name: String
    let description: String
    let address: String
    let image: String
    let like: Int
    
}
