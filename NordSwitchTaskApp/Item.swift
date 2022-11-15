//
//  Item.swift
//  NordSwitchTaskApp
//
//  Created by Justina Siaulyte on 2022-11-15.
//

import UIKit

struct Item {
    let load: Int
    let name: String
    let status: Status
}

extension Item: Decodable {
    enum CodingKeys: String, CodingKey {
        case load, name, status
    }
}

enum Status: Decodable {
    case online
    case offline
}

struct Wrapper: Decodable {
    let items: [Item]
}

enum NetworkError: Error {
    case badUrl
    case jsonDecodeFailed
}

