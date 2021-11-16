# Flutter-II-Movies
Flutter App with BLoC pattern

This application is a little Covid Tracker (even if it's called Movies).
This little document is made of two main parts, one for the project set up and the other for the API.

**PLEASE FOLLOW EVERY STEP IN THE SET UP PART TO LAUNCH THE SERVER AND THE APPLICATION**

## Project Set Up

### The server
This project is made of a mobile application working with an API, so to use this API, you need to launch the server.

#### Node
In order to launch the server, you need to have node installed on your computer.
It you don't have it, you can refer to the following link to download it: [Install Node.js](https://nodejs.org/en/download/) 

#### Launch the server
To launch the server, you need to clone the repository on your device.
Then you can launch the server by going into our `server` folder.
Once you're in, you can run the ```npm install``` command then the ```npm start``` one.

If you're facing any kind of issues, it should mostly refer to your `node` version.
You can switch node version with [nvm](https://github.com/nvm-sh/nvm#installing-and-updating).
Be sure to launch with the latest stable version, and at least the **v14**.

### The mobile application
For both of the platforms, please be sure to run the project with at least the flutter **2.5.3** version and the dart **2.14.2** version.

If you some help, use following links:
- [Android Studio Installation](https://developer.android.com/studio/install)
- [Get Dark SDK](https://dart.dev/get-dart)
- [Install Flutter](https://flutter.dev/docs/get-started/install)

Once the project is ready to go, you can click on the Run command in your IDE or run the command `flutter run`.

#### iOS
If it happens that the server cannot be reached with the default configuration, follow the Android set up down below.

#### Android
To run the project on Android, it is a **MUST** to change the URL endpoint value, because otherwise, it will not consider the server endpoint even if it is running.
To do this, please open the file to next path from the repository root: `movies/lib/config/constants.dart`.
You should be able to see the `API_URL` on the second line. Please replace the current value by `http://<YOUR_IPV4_ADDRESS>`, and replace the tag `YOUR_IPV4_ADDRESS` by your current IPv4 address.
If you don't know how to find your IpV4 address:
- **On MacOS** here is a [quick help](https://www.hellotech.com/guide/for/how-to-find-ip-address-on-mac).
- **On Windows** here is a [tuto](https://support.microsoft.com/en-us/windows/find-your-ip-address-in-windows-f21a9bbc-c582-55cd-35e0-73431160a1b9)
- **On Linux** get in the wi-fi settings, click on your current wi-fi settings and check the address next to the IPv4 field or run the command ```ip addr show | grep "inet 192"``` and it is the value going from `192` to the `/`.

## API

This is a short documentation about API usage.
All routes return a status code with a message and a result array.
The result array is empty when the call fail or when it doesn't need to return a result.

PORT: 8080

### Route list : 
- User :
  - [POST] /register
  - [POST] /login
  - [GET] /me
  - [PUT] /user/update
  - [DELETE] /user/delete
  
- Countries : 
    - [GET] /country
    - [GET] /countries

### User's route

- Register : 
  - Body example : ```{ 'email': 'test@email.fr', 'password': 'password', 'username': 'Name' }```
  - Return : jwt
- Login : 
  - Body example : ```{ 'email': 'test@email.fr', 'password': 'password' }```
  - Return : jwt
- Me :
  - Body example : ```{}```
  - Query param : jwt (example: ```http://localhost:8080/me?jwt=ad0dea00-7b40-4fcc-98ea-8afe6428f265```)
  - Return : complete user
- Update :
  - Body example : ```{ "fields": {"email": "Lucas@email.fr"} }```
  - Query param : jwt (example: ```http://localhost:8080/user/update?jwt=ad0dea00-7b40-4fcc-98ea-8afe6428f265```)
  - Return : []
- Delete :
  - Body example : ```{}```
  - Query param : jwt (example: ```http://localhost:8080/user/delete?jwt=ad0dea00-7b40-4fcc-98ea-8afe6428f265```)
  - Return : []
  
### Countries's routes
- country :
  - Body example : ```{}```
  - Return : complete information about one country
- countries :
    - Body example : ```{}```
    - Query param : countryName (example: ```http://localhost:8080/country?countryName=Afghanistan```)
    - Return : array containing all countries information

