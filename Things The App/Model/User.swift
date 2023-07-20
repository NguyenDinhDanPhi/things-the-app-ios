//
//  User.swift
//  Things The App
//
//  Created by dan phi on 20/07/2023.
//

import Foundation
struct User: Codable, Identifiable {
    let id = UUID()
    let login: String
}
