# Table of Contents
1. [Description](#description)
2. [Architecture](#architecture)
3. [Structure](#structure)
4. [Deployment](#deployment)
5. [Dependencies](#dependencies)
6. [Design](#design)
7. [API](#api)

# skoda-tender-ios

# Description
This project is a iOS application that provides services related to car connectivity. It includes functionalities such as:

Checking the information of your car (locked, temperature, battery, etc..)
Receiving notifications with details such as VIN, title, and message.
The application is designed to use Škoda Connect Services, ensuring seamless car connectivity and user management.

# Architecture
* skoda-tender-ios project is implemented using the <strong>Model-View-ViewModel (MVVM)</strong> architecture pattern.
* Model has any necessary data or business logic needed to generate the app.
* View is responsible for displaying the message to the user, such as printing it to the console.
* ViewModel handles any user input or interactions and update the Model and View as needed.
* Project doesn't have a database or any other complex elements.
* Project uses SwiftUI for the views.
* Project only as dark theme.
* Project Follows clean Architecture.


# Structure has any necessary data or business logic
* "Domain": Files with any necessary data or business logic needed to operate the app
* "Data": Files or classes related to communicating with an external API. This could include code for making HTTP requests to a web server, parsing responses, and handling any errors that may occur.
* "Presentation": The source code files for views and view models.
* "Shared": Files or resources that are shared across multiple parts of the project. Such as utility classes, global constants, or reusable UI elements.

# Deployment
Keep in mind that deploying an iOS app to the App Store requires having an Apple Developer account.

1. Click on the "Product" menu in Xcode and select "Archive." This will create an archive of your project.
2. Once the archive has been created, select it in the Organizer window and click on the "Validate" button to perform some preliminary tests on the app.
3. Once validation is complete, click on the "Distribute" button and select "Ad Hoc" or "App Store" distribution. 
This will create a signed IPA file that can be installed on iOS devices.
4. Follow the prompts in the distribution wizard to complete the distribution process.
5. Once the distribution is complete, you can use the IPA file to install the app on iOS devices

# Dependencies
Swift Package Manager is used as a dependency manager.
List of dependencies: 
* 'Alamofire' -> Networking library that ensures that the message reaches everyone in the world.
* 'Firebase' -> Our library that serves for authorization. 
* 'SDWebImageSwiftUI' -> Image loader. 
It is very important that <strong>it is maintained because it is also used by users outside the company</strong>.

# Workflow

* Reporting bugs:<br> 
If you come across any issues while using the skoda-tender-ios, please report them by creating a new issue on the GitHub repository.

* Reporting bugs form: <br> 
```
App version: 2.12
iOS version: 16.1
Description: When I tap on the "Send" button, my friends don't receive message.
Steps to reproduce: Open "Messages" flow of the app, write down message, press "Send" button.
```

* Submitting pull requests: <br> 
If you have a bug fix or a new feature you'd like to add, please submit a pull request. Before submitting a pull request, 
please make sure that your changes are well-tested and that your code adheres to the Swift style guide.

* Improving documentation: <br> 
If you notice any errors or areas of improvement in the documentation, feel free to submit a pull request with your changes.

* Providing feedback:<br> 
If you have any feedback or suggestions for the skode-tender project, please let us know by creating a new issue or by sending an email to the project maintainer.


# Design 
* Design tool for our teams is [Figma](https://www.figma.com)
* Link to the design flow is [here](https://flow.skoda-brand.com/) <br>
* All of the design is and must be only in one tool and currently it is Figma.<br>
* Basic UI elemnts are defined and can be found [here](https://www.figma.com)

# API 
* We are using a REST API
* List of API calls is [here]("http://skoda-services-dev-1394477866.eu-central-1.elb.amazonaws.com/swagger-ui/index.html") 
* For HTTP networking we are using [Alamofire](https://github.com/Alamofire/Alamofire) 
