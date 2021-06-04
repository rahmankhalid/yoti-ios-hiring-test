//
// Copyright © 2021 Yoti Ltd. All rights reserved.
//


import Foundation

final class CountryNetworkService {
    let session = URLSession.shared
    
    func perform(urlRequest: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void) {
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error { completion(.failure(error)) }
            completion(.success(data))
        }.resume()
    }
}
