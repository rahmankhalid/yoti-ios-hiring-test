## CountiesAndCapitals

`CountriesAndCapitals` is a project aimed to display the Countries alongside their capitals to the end user. We have provided some code parts to assist you but in case you think they need to be improved or altered for your implementation please don't hesitate to remove them. 


### User Stories

#### User Story 1
As a user I would like to be able to see all countries and capitals on my iPhone device.

Technical Requirements
- The list of capitals and countries can be retrieved using the public API located [here](https://restcountries.eu/rest/v2/all).
- No third party library / framework should be used throughout the implementation.
- The implementation should be primarily focused on iPhone devices.

#### Notes: 

- The REST API is able to provide a full list of information for the countries but we are only interested in the capitals. You will find below a JSON sample with the information required for this exercise.

```JSON
[
    {
        "name": "United Kingdom of Great Britain and Northern Ireland",
        "capital": "London"
    },
    {
        "name": "France",
        "capital": "Paris"
    }
]
```

### App Information

Platform: iOS
Language: Swift 5
Deployment Target: Min iOS 13

### Design

Collection View with Diffable Data Source
Light and Dark Mode Capabilities 

### Architecture

The architecture design followed was Clean Architecture with the presentation layer following MVVM. A very basic coordinator class was created as well as a very basic Dependency Injection Container.

**Data Layer**
No changes were made to the existing request. 
A repository class was created to seperate all information about how the request is made and how to manage the response. This can be improved by adding generics to handle the response. Codable was used to to make it easy to convert the JSON data.
I've also added mapping on JSON data to the Domain Models. This removes the need for the domain to update when there's any changes in the API. 
The feature can also be added to add multiple data sources e.g. Local database to get saved capital cities. 

**Domain Layer**
This layer contains the entity, use case and repository interface. If the app was to be expanded, this layer could be reused in other aspects of the app. 
The use case in this app gets all the countries with the capital cities. It also contains data repository interface which is needed for dependency inversion. 

**Presentation Layer**
This layer contains the view model which observe changes that happens in the VC. This can be expanded by adding 'actions' if the user wanted to navigate to e.g. a detail page. 
Flow coordinator is used to navigate to the main app but can be expanded to navigate to different sections of the app. 

Data binding between View and View Model can be done in a number of ways but I have opted with observables. The view has a direct relationship with the view model and sends a notification once an event has taken place. 


