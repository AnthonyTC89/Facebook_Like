# README

Created by Microverse students [Anthony Tapia](https://github.com/AnthonyTC89) and [Matheus Silva](https://github.com/matheus-fls) as part of the Ruby on Rails Curriculum.

About => This is the final project about Ruby on Rails. It covers more advanced concepts of Rails like APIs. 

[here](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project).

Instructions to install:

1.  Clone the repository https://github.com/AnthonyTC89/Facebook_Like
2.  Run `sudo apt-get install libpq-dev` [optional] (You need to have installed the postgreSQL dev package with header of PostgreSQL)
3.  Run `bundle install`
4.  Run `sudo -i -u postgres`
5.  Run `createdb facebook`
6.  Run `psql facebook`
7.  Run `CREATE USER rails with encrypted password 'rails';` (with semicolon)
8.  Run `grant all privileges on database facebook to rails;`
9.  Run `ALTER DATABASE facebook OWNER TO rails;`
10. Run `ALTER USER rails createdb;` 

-> If you launch the rails server and receive an error message:
   * Run `psql facebook`
   * Run `\conninfo`
   * Check if the port is the same as in the development session on ~/config/database.yml. 
   * Change to the port displayed on `\conninfo` if needed.
   