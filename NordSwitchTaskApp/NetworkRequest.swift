//
//  NetworkRequest.swift
//  NordSwitchTaskApp
//
//  Created by Justina Siaulyte on 2022-11-15.
//

import Foundation

struct Resourse {
    var url: URL? {
        let urlString: String = "https://api.nordvpn.com/v1/servers?limit=10&fields%5Bservers.name%5D&fields%5Bservers.status%5D&fields%5Bservers.load"
        return URL(string: urlString)
    }
}

class NetworkRequest {
    let resource: Resourse = Resourse()
    
    func execute() -> [Item]? {
        guard let url = resource.url else { preconditionFailure("Failed to construct url") }
        
        Task {
            return await loadData(with: url)
        }
        return nil
    }

    func loadData(with url: URL) async -> [Item]? {
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.badUrl }
            return decode(data)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

    func decode(_ data: Data) -> [Item]? {
        let decoder = JSONDecoder()
        do {
            let wrapper = try decoder.decode(Wrapper.self, from: data)
            return wrapper.items
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
