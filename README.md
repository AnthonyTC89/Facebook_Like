<p align="center">
  <h1 align="center">FACEBOOK CLONE</h1>

  <p align="center">
    Project Create with Ruby on Rails
    <br>
    <br>
    <a href="https://facebook-like-clone.herokuapp.com" target="_blank">Live Demo</a>
    .
    <a href="https://github.com/AnthonyTC89/Facebook_Like/issues">Report Bug</a>
    ·
    <a href="https://github.com/AnthonyTC89/Facebook_Like/issues">Request Feature</a>
  </p>
  <br>
</p>

![Screenshot](/screenshots/01.png)

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Built With](#built-with)
* [Installation](#installation)
* [Contact](#Contact)

<!-- ABOUT THE PROJECT -->
## About The Project

This project is part of the course [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project). The goal of the project is learn is apply our knowledge of Ruby on Rails to build a Social Network that allows interactions between users, including the ability to create and send posts, comments and likes. 

### Built With
* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby on Rails](https://rubyonrails.org/)
* [Bootstrap](https://getbootstrap.com/)

### Installation
  1. clone the repository [Facebook_Like](https://github.com/AnthonyTC89/Facebook_Like)
  2. Run `sudo apt-get install libpq-dev` [optional] (You need to have installed the postgreSQL dev package with header of PostgreSQL)
  2. cd in the app folder and run `bundle install`
  3. run `yarn install --check-files` if it's necessary
  4. run `rails db:create && rails db:migrate`
    * (If there are problems with the service of postgresql check DB Section) 
  5. run `rails server`
  6. go to `localhost:3000`

-> If you launch the rails server and receive an error message:
   * Run `psql facebook`
   * Run `\conninfo`
   * Check if the port is the same as in the development session on ~/config/database.yml. 
   * Change to the port displayed on `\conninfo` if needed.

### DataBase Setup
  1. Run: `sudo apt-get update && sudo apt-get install postgresql`
  2. Run: `sudo service postgresql start`
  2. Run: `sudo -i -u postgres`
  3. Run: `psql`
  4. Run: `CREATE USER rails with encrypted password 'rails';` (with semicolon)
  5. Run: `ALTER USER rails createdb;`
  
## Future Features
  * Improve overall design
  * Add two-step authentication
  * Add groups and events

### Contact

* **[Anthony Tapia Cossio](https://github.com/AnthonyTC89) - [Linkedin](linkedin.com/in/anthony-tapia-cossio) - [Twitter](https://twitter.com/ptonypTC) - [Portfolio](https://portfolio-anthony.herokuapp.com/)**

* **[Matheus Silva](https://github.com/matheus-fls)**
