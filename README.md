# Flutter-II-Movies
Flutter App with BLoC pattern

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
