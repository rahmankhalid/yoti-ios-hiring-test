//
//  CountryRepository.swift
//  CountriesAndCapitals
//
//  Created by Khalid Rahman on 04/06/2021.
//  Copyright © 2021 Yoti Ltd. All rights reserved.
//

import Foundation

final class CountryRepository: CountriesRepository {
    
    func getCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        let service = CountryNetworkService()
        // For the testing purposes, url is hard coded
        let request = URLRequest(url: URL(string: "https://restcountries.eu/rest/v2/all")!)
        
        service.perform(urlRequest: request) { result in
            var countries = [CountryReponse]()
            
            switch result {
            case .success(let data):
                
                guard let data = data else {
                    let error = NSError(domain: "com.yoti", code: 1001, userInfo: nil)
                    completion(.failure(error))
                    return
                }
                
                do {
                    let jsonDecoder = JSONDecoder()
                    countries = try jsonDecoder.decode([CountryReponse].self, from: data)
                } catch let error {
                    print(error)
                }
            
                
                completion(.success(self.mapCountryResponse(with: countries)))
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCountryResponse(with response: [CountryReponse]) -> [Country] {
        var countries = [Country]()
        for country in response {
            countries.append(country.toDomain())
        }
        return countries
    }

    
}
