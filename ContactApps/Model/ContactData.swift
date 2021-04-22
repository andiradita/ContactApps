//
//  ContactData.swift
//  ContactApps
//
//  Created by Andi Radita on 22/04/21.
//

import Foundation

struct ContactData: Codable {
    let results : [Contact]
}

struct Contact : Codable {
    let gender : String
    let name : InfoName
    let dob : InfoDob
    let email : String
    let phone : String
    let cell : String
    let picture : Picture
}

struct InfoName : Codable {
    let title : String
    let first : String
    let last : String
}

struct InfoDob : Codable {
    let date : String
    let age : Int
}

struct Picture : Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Location : Codable {
    let city: String
    let coordinates: Coordinate
    let country: String
    let postcode: Int
    let state: String
    let street: Street
}

struct Coordinate : Codable {
    let latitude: String
    let longitude: String
}

struct Street : Codable {
    let name: String
    let number: Int
}
