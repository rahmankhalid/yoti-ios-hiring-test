# Yoti iOS Hiring Test

**Document Version 1.0**

This repository contains the coding exercise for Yoti's iOS Role. 

## Context


Our experience has shown us that a Software Engineer but more precisely an iOS developer is going to face many challenges during the implementation or the refactor process of a feature. The following project (CountriesAndCapitals) is a project which is, in our opinion, quite representative on the tasks required to complete a feature.

------

## Instructions and Requirements

For the completion of the exercise we are expecting from you to do the following:

- Clone and commit the project locally
- (Optional) In case you would like to provide further expanation on your solution you can attach it in the email of your reply.

**Please avoid doing the following as they will get your application disqalified**

- Fork the project.
- Submit a Pull Request on the repo.
- Submit a solution made by someone else.
------

## Recommendations

- Please read the instructions carefully
- Try to keep the implementation timeboxed. We recommend not to take more than 3 hours to complete this exercise.
------

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
- UI implementation: Please choose your prefered way to display the information described in "User Story 1". Your implementation is not going to be evaluated based on aesthetic criteria but on technical implementation. So feel free to choose something that you think is a good solution of the purpose and scope of this project.