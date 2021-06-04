//
// Copyright © 2021 Yoti Ltd. All rights reserved.
//

import XCTest

@testable import CountriesAndCapitals

class CountriesAndCapitalViewModelTests: XCTestCase {

    class CountriesUseCaseMock: CountriesUseCase {
        var expectation : XCTestExpectation?
        var error       : Error?
        var countries   : [Country]?
        
        func execute(completion: @escaping (Result<[Country], Error>) -> Void) {
            if let error = error {
                completion(.failure(error))
            } else {
                if let countries = countries {
                    completion(.success(countries))
                }
            }
            expectation?.fulfill()
        }
    }
    
    func test_countriesUseCase_makeSuccessfulRequestAndReturnCountries() {
        // given
        let useCase = CountriesUseCaseMock()
        useCase.expectation = self.expectation(description: "Fetched countries")
        useCase.countries   = [Country(name: "United Kingdom", capital: "London")]
        
        let viewModel       = CountriesAndCapitalViewModel(useCase: useCase)
        
        // when
        viewModel.getCountries()
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(viewModel.countries.value.contains(Country(name: "United Kingdom", capital: "London")))
    }
    
    func test_countriesUseCase_makeRequestWithError() {
        // given
        let useCase = CountriesUseCaseMock()
        useCase.expectation = self.expectation(description: "Fetched countries")
        
        let viewModel       = CountriesAndCapitalViewModel(useCase: useCase)
        
        // when
        viewModel.getCountries()
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(viewModel.countries.value.isEmpty)

    }
    
}
