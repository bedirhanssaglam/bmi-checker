# My BMI Checker

An application that calculates the body mass index and makes some suggestions.

# Application Screenshots

![app_screenshots](https://user-images.githubusercontent.com/105479937/207308161-62731a7a-95ca-4cf5-9415-0b9885ea3f7c.png)

## Getting Started

First of all, there are two main builds in our lib folder. These are view and core structures.

- core: This layer is the part that will manage or initiate the work that will do our main work

base: This layer contains our main state and model files.

components: This layer contains widgets that we can use on the pages, such as button, text, checkbox, which we can create here and customize with parameters where we want to use them.

constants: This layer consists of two structures, these structures are app and navigation structures. We keep certain variables that we will use in the project in the app structure. For example , if we are using rest api , we can keep the base url of this rest api , if there will be a language option in the application , we can keep the languages ​​to be used and the colors we will use in the project depending on the usage style .

extensions: This layer and the project contain the basic structure, String, Context, or structures that are created to give features to the classes or structures we have created. For example, adding a property called emailValidation to the String structure for validation processes used in auth screens can be given as an example.

init: This layer consists of 4 main structures. These structures are lang , navigation , network and theme . As it can be understood from its name, in the Lang structure, the structures related to the languages ​​supported by the application, the routing structure in the application in the navigation structure, the network structure that changes depending on the network layer that the application will use in the network structure, and the theme structures that will be used in the application in the theme structure are kept.

-view: This layer contains our screens. We can create a folder for each screen and keep a viewModel or model file for this screen, if necessary, in this folder.
