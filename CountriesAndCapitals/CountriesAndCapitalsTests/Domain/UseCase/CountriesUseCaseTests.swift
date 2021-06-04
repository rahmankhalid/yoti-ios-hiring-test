//
// Copyright © 2021 Yoti Ltd. All rights reserved.
//


import XCTest

@testable import CountriesAndCapitals

class CountriesUseCaseTests: XCTestCase {
    
    static let countries: [Country] = {
        return [Country(name: "United Kingdom", capital: "London"), Country(name: "France", capital: "Paris")]
    }()

    class CountriesRepositoryMock: CountriesRepository {
        func getCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
            completion(.success(countries))
        }
    }
    
    func testCountriesUseCase_whenSuccessfullyGetCountries() {
        // given
        let expectation = self.expectation(description: "Get countries successful")
        expectation.expectedFulfillmentCount = 2
        
        let repo = CountriesRepositoryMock()
        let useCase = MainCountiesUseCase(repository: repo)
        
        // when
        useCase.execute(completion: { _ in
            expectation.fulfill()
        })
        
        // then
        var countries = [Country]()
        
        repo.getCountries { result in
            countries = (try? result.get()) ?? []
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(countries.contains(Country(name: "United Kingdom", capital: "London")))
    }

}
