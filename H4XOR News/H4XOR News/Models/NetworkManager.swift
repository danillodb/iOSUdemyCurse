//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Danillo Diniz Barbosa on 23/04/25.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func didFetchNews(_ news: [News])
    func didFailWithError(_ error: Error)
}

class NetworkManager: ObservableObject {
    @Published var posts: [News] = []
    let baseURL = "https://hn.algolia.com/api/v1/search?tags=front_page"
    //let delegate: NetworkManagerDelegate? = nil
    
    func fetchData() {
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, _, error) in
                if let exception = error  {
                    print(exception)
                    //self.delegate?.didFailWithError(exception)
                } else if let jsonData = data {
                    let decoder = JSONDecoder()
                    do {
                        let results = try decoder.decode(Results.self, from: jsonData)
                        //self.delegate?.didFetchNews(results.hits)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                        //self.delegate?.didFailWithError(error)
                    }
                }
            }
            task.resume()
        }
    }
}

struct Results: Decodable {
    let hits: [News]
}

struct News: Decodable, Identifiable {
    let objectID: String
    let title: String
    let url: String?
    let text: String?
    let points: Int
    var id: String {
        return objectID
    }
}
