# News Mobile App

¡Hi! I've created this little app, using the UIKit framework from Swift.
For this project I decided follow the **MVC** pattern, because is the most used design pattern in iOS development. 

These are the reasons why I choose MVC Pattern:

 - It's in the UIKit core implementation
 - Due to the size project, I think we have a good modularity between the components, with a good separations of concerns between views, controllers and models.
 - I have done most of my iOS projects using this pattern.
 - It´s easier to read and understand (not the most ideal) than the MVVM pattern.

# Folder structure
The current project follows this folder structure:

 - **Support**: Here we can find the core files of our app like AppDelegate, SceneDelegate, Assets and LaunchScreen. These files are responsible for instantiate our app, windows and scenes, implementation of the splash screen and storing the images we are going to use throughout the project.
 - **Custom Views**: In this folder we store the custom views that are used in many parts of the codebase, they are organized for views types, like: UIButtons, TabBarControllers, UIImageView, UILabels, etc...
 - **Screens**: Here we have the view controllers that are related to all the main screens of our app.
 - **Manager**: This is my implementation of the NetworkManagerClass, in here you can find all the API related stuff, like **get** petitions to retrieve data from the News API.
- **Manager**: This is my implementation of the NetworkManagerClass, in here you can find all the API related stuff, like **get** petitions to retrieve data from the News API.
- **Models**: Here we have all the models used to store and decode the data retrieved from the server. 
 - **Utilities**: Inside of this, you can find all the custom errors used for catch blocks in our app and a constants file where are the different images used in the project.
  - **Extensions**: Implementations of the different extensions.

# Steps to open the project

 1. Clone the current repo to xcode.
 2. Open the project and you can hit the build button to see the simulator.
 3. In order to see the project properly I reccomend to use an iphone 15 pro as the current device in the simulator. We use iOS 17.5.

