![image](/public/app_exchange.png)

# Exchange

This app lets you convert several diferent currencies. It works by consuming and external RESTful service. Feel free to clone and fork it as you please!

## Installation

This app runs on a docker container. The following commands are necessary to set up the environment on your machine.

* Make sure you have docker and docker-compose installed.

* Run ```docker-compose build``` to install all gems.

* Run ```docker-compose up``` to start the application.

* The app should be available on http://localhost:3000

For production don't forget run ```docker-compose run --rm website bundle exec rake assets:precompile```

## Database

Keep in mind that it's not necessary to structure an actual database for running this application. But to create a database and run all migrations. Run:
```
docker-compose run --rm website rails db:create && docker-compose run --rm website rails db:migrate
Tests
```
The capybara and rspec gems are used for testing. The following command should run them.
```
docker-compose run --rm website rspec
```
