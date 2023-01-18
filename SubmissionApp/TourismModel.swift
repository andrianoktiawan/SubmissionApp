//
//  TourismModel.swift
//  SubmissionApp
//
//  Created by Andrian Oktiawan on 18/01/23.
//

import Foundation
import UIKit

struct TourismModel {
    let id: Int
    let name: String
    let description: String
    let image: UIImage
}

let dummyTourismData = [
    TourismModel(
        id: 145,
        name: "Memulai Pemograman Dengan Swift",
        description: "Belajar bahasa Swift buat kamu yang ingin mempelajari konsep dasar pemrograman dalam mengembangkan aplikasi iOS ,iPadOS, macOS.",
        image: UIImage()
    ), TourismModel(
        id: 171,
        name: "Belajar membuat aplikasi iOS Pemula",
        description: "Pelajari cara membuat aplikasi pertamamu dengan Xcode. Kelas ini mengajarkan dasar yang dibutuhkan mulai dari Controller sampai TableViews.",
        image: UIImage()
    ), TourismModel(
        id: 202,
        name: "Belajar Fundalmental Aplikasi iOS",
        description: "Pelajari komponen fundamental iOS berdasarkan teknik yang digunakan industri mulai dari App Design, SwiftUI, Networking, sampai Database.",
        image: UIImage()
    ), TourismModel(
        id: 209,
        name: "Menjadi iOS Developer Expert ",
        description: "Saatnya menjadi iOS Expert dengan belajar Clean Code, Design Pattern, Clean Architecture, Reactive Programming, DI, Modularization, dan TDD.",
        image: UIImage()
    )
]


