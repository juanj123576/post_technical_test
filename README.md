# post_technical_test Project



## Getting Started
The post_technical_test contains is made with a structure based in MVC, using providers as state Management. in this project you can see the posts uploaded in the api https://jsonplaceholder.typicode.com/posts, also add them as favorites and see which is the most viewed post.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/juanj123576/post_technical_test.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**


```
flutter run
```



##  Features:


* Login
* Home
* Routing
* Dio
* Database (firebase)
* Provider (State Management)
* rflutter_alert
* persistent_bottom_nav_bar
* shared_preferences



### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Provider](https://github.com/rrousselGit/provider) (State Management)
* [rflutter_alert](https://github.com/RatelHub/rflutter_alert.git)
* [persistent_bottom_nav_bar](https://github.com/BilalShahid13/PersistentBottomNavBar.git)
* [shared_preferences](https://github.com/flutter/plugins/tree/master/packages/shared_preferences)
* [Firebase_auth](https://github.com/FirebaseExtended/flutterfire/tree/master/packages/firebase_auth/firebase_auth)
* [firebase_core](https://github.com/FirebaseExtended/flutterfire/tree/master/packages/firebase_core/firebase_core)

### Folder Structure
Here is the core folder structure which flutter provides.

flutter-app/
|- android
|- build
|- ios
|- lib
|- test


Here is the folder structure we have been using in this project

```
lib/
|- const/
|- models/
|- services/
|- pages/
|- widgets/
|- main.dart
|- providers/
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- const - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `dimentions`, `api endpoints`, `preferences` and `strings`.
2- models - Contains the user, and post model.
3- services - Contains the firebase auth services for loggin functions. 
4- pages — Contains all the ui of your project.
5- widgets — Contains the common widgets for your applications. For example, Button, TextField, and listview, etc.
6- providers — Contains the postprovider for state-management of your application, to connect the reactive data of your application with the UI. 
7- main.dart - This is the starting point of the application.
```

### Const

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
const/
|- colors.dart
```
### models

Contains the user, and post model. The user model is created when the user  shoot the action for login, sign up or sign out in firebase auth. The post model is created with the data from https://jsonplaceholder.typicode.com/posts :

```
models/
|- user.dart
|- post_model.dart

```

### providers

All the business logic of your application will go into this directory, it represents the data layer of the application.

```
providers/
|-post_providers.dart
  

```

### services

In this carpet there is the file with the logic to sign up in firebase auth, it´s a class that contains the methods for login, sign up and sign out. Also, this logic is implemented with streams and provider:

```
services/
    |- auth_service.dart
    
```

### pages

This directory contains all the ui of your application.  All the screen specific widgets will be placed in `widgets` directory :

```
pages/

   |- login.dart
   |- todos_screen.dart
   |- favorites_screen.dart
   |- settings.dart
```



### Widgets

Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc. In this widgets, there is one very important, and it´s "nav.dart", this file have the plugin for persistent bottom-navigation-bar across screens. Also, the "wrapper.dart" file is where the logic of firebase auth streams it´s used.

```
widgets/
|- nav.dart
|- post_details.dart
|- post_item.dart
|- wrapper.dart
```



## Conclusion
If you have any question don´t be ashame and contact to me with any doubt at this email: juanjpolo17@gmail.com. Thank you very much.
