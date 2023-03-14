//
//  Model.swift
//  URLSession Part-1 HM
//
//  Created by Dinar on 28.02.2023.
//

import Foundation

// MARK: - DataSpace
struct DataSpace: Codable {
    let photos: [Photo]
}
// MARK: - Photo
struct Photo: Codable {
    let id, sol: Int
    let camera: Camera
    let imgSrc: String
    let earthDate: String
    let rover: Rover

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

// MARK: - Camera
struct Camera: Codable {
    let id: Int
    let name: String
    let roverID: Int
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

// MARK: - Rover
struct Rover: Codable {
    let id: Int
    let name, landingDate, launchDate, status: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}

    

// MARK: - ButtonOne
/*
 id": 92576,
   "answer": "7",
   "question": "When writing, many Europeans cross it; most Americans don't",
   "value": 800,
   "airdate": "2008-12-08T12:00:00.000Z",
   "created_at": "2014-02-14T01:58:09.356Z",
   "updated_at": "2014-02-14T01:58:09.356Z",
   "category_id": 8472,
   "game_id": null,
   "invalid_count": null,
   "category": {
     "id": 8472,
     "title": "a number from 1 to 10",
     "created_at": "2014-02-11T23:28:10.844Z",
     "updated_at": "2014-02-11T23:28:10.844Z",
     "clues_count": 10


 
 */
