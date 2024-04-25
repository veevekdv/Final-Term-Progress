# Description
Over the past month, I've been diligently working on a project that builds on the knowledge I gained from the HackRPI API workshop. My goal was to develop a straightforward application featuring both a front end and a back end. I particularly wanted to improve my skills in React, as I initially found the front end development challenging. Additionally, I was eager to deepen my understanding of authentication mechanisms, so I implemented these in the back end as per what I learned in the workshop.

# Tutorials Followed:
- React Tutorial: https://www.youtube.com/watch?v=j942wKiXFu8&list=PL4cUxeGkcC9gZD-Tvwfod2gaISzfRiP9d
- NodeJS Tutorial: https://www.youtube.com/playlist?list=PL4cUxeGkcC9jsz4LDYc6kv3ymONOKxwBU
- JRWT: [https://www.youtube.com/watch?v=932LdhYEqyY](https://www.youtube.com/watch?v=7Q17ubqLfaM)
- Github Tutorial: https://www.youtube.com/watch?v=tRZGeaHPoaw
- MVC Model: https://www.youtube.com/watch?v=DUg2SWWK18I
- REST APIs: https://www.youtube.com/watch?v=OJdFj5hPAKs


# Todo API

This project provides a RESTful API for a Todo application using Node.js and Express. It allows users to create, retrieve, update, and delete todo items. Each todo item can have a title, description, and due date.

API Endpoints
## GET /todos
Retrieves all todos.

## POST /todos
Creates a new todo. Requires a JSON body with title, description, and dueDate.

## GET /todos/:id
Retrieves a todo by its ID.

## PUT /todos/:id
Updates a todo by its ID. Can update title, description, and completed status.

## DELETE /todos/:id
Deletes a todo by its ID.

Middleware
getTodo: Middleware to find a todo by ID and attach it to the request. Used in the GET, PUT, and DELETE routes.

## Models
Todo Model
title: String
description: String
dueDate: Date
completed: Boolean (default: false)
Errors
Responses will include an appropriate HTTP status code and a JSON body with a message field describing the error or success message.

## POST /register
Registers a new user. Requires a JSON body with username and password.

## POST /login
Authenticates a user and returns a JWT. Requires a JSON body with username and password.

## Security
Passwords are hashed using bcrypt before storage. Authentication tokens are generated using JWT, which should be provided in the authorization header of requests requiring authentication.

- Models
User Model
username: String (unique)
password: String (hashed)
Errors
The API responses include appropriate HTTP status codes. Errors return a JSON object with a message field describing the issue.
