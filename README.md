# unsplashApi

#### Intro :

This straightforward application retrieves data from the Unsplash API and presents bloggers along with their fundamental personal information. The application further enables users to interact with each individual user's profile, showcasing detailed information about them.

Employing the MVVM architecture in conjunction with the SOLID principles, the app integrates the repository pattern and incorporates dependency inversion to establish a modular codebase. This approach enhances maintainability and flexibility.

By leveraging cutting-edge Apple technologies, particularly SwiftUI, the app constructs a modern and engaging user interface. Additionally, the use of async/await for service calls ensures smooth and non-blocking data retrieval.

It's worth highlighting that, for handling service calls, alternative approaches such as Combine's AnyPublisher or Future Promise could have been explored instead of the conventional method involving closures. These alternatives could have introduced additional asynchronous handling strategies to the application.

#### Quick start :

Launch the application using either a physical device or a simulator. Upon launching, a horizontally arranged list of Bloggers with their essential personal information will be presented to you. Navigate by scrolling left or right to access the complete blogger list. By clicking on a specific blogger, you will be directed to a detailed page that showcases the blogger's name, photograph, and description.

#### Status :

- The application presently employs SwiftUI to craft its user interface. It has been constructed following the MVVM architecture and incorporates Test Cases. Additionally, the app utilizes asynchronous operations with the async-await pattern for fetching data from the API.

- The API calls have been implemented through URLSession to retrieve essential data. Subsequently, the retrieved JSON data is parsed using JSONDecoder and exhibited within the application's user interface.

- To ensure compatibility, the app accommodates various iOS screen sizes and is designed to be compatible with iOS 13 and subsequent versions.

- Unit tests for the network layer have been composed using XCTest. Furthermore, robust error-handling mechanisms have been put in place.

- The app uses image Caching mechanism to optimise performance


#### What's included :

- Model: The model serves as the core representation of an application's data and its underlying business logic. Through this model, we can effectively manage and uphold the application's crucial data. This data is sourced as a response retrieved from an API.

- Network: Employing the async/await approach, I implemented asynchronous service calls to the backend, facilitating the retrieval of data pertaining to bloggers. This approach enhances the responsiveness of the application.

- Repository: Introducing an additional layer, the repository, has enabled us to enhance the separation between the view and the underlying business logic. This decoupling contributes to improved modularity.

- ViewModel: Responsible for both exhibiting data to the user and managing their interactions, the ViewModel assumes a pivotal role in the user experience.

- View: Within this layer, the user interface components—planetListView, planetCell, and planetDetailView—are encompassed, collectively forming the app's visual elements.

- Caching: This layer is dedicated to optimising app performance by ensuring that images are downloaded only once, subsequently minimising redundant data fetching.

- Custom Error Handling: By implementing custom error handling mechanisms, the application becomes adept at identifying potential errors throughout its lifecycle, consequently presenting relevant error messages to users.

- Dependency Injection: Leveraging dependency injection to establish connections between layers has granted them a high degree of independence. This strategic design allows for seamless replacement of dependencies, minimising the impact on other aspects of the application. Notably, the utilisation of a MockedNetworkManager during network layer testing stands as a testament to this concept, showcasing its practical implementation.

#### Recommendations for future features and improvements :

- Coordinator pattern to further separate navigation related logic

- Accessibility: Semantic and visual accommodation for Motor Impaired User, Visual Impaired users, voice over users, Motion Impaired users,  Colour Blinded User and Hearing Impaired users

- Local storage such as  Core Data to save and fetch data saved on the database for offline capabilities.  We can also store secret keys and tokens in keychain and apply encryption to them

- Use of Generics

- UITest and BDD Testing

- Static code analyser ex sonarqube

#### Screen shots :

<img width="331" alt="Screenshot 2023-08-10 at 01 45 17" src="https://github.com/yvesduke/unsplashApi/assets/8191486/1e02bc69-4edd-412c-b5ae-dec38e5147e3">

<img width="319" alt="Screenshot 2023-08-10 at 01 46 54" src="https://github.com/yvesduke/unsplashApi/assets/8191486/c35e9016-3ed6-466b-bde6-057937def639">
