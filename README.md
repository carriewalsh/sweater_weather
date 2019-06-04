# Sweater Weather
by Carrie Walsh

Deployed site: https://serene-brook-41842.herokuapp.com

This solo project is an API that provides the json-ified weather data for a weather app (yet to be made). The fifty most populous cities are imported into the database and every time a new city is searched, that becomes a new data point. The weather data is separated into 3 tables:
- CitySteadies - sunrise/sunset/moon_phase - as these do not change
- CityDays - the forecasts for the next several days - only updated daily
- CityCurrents - current forecast data for city - updated frequently

It provides the database for users to be registered as well as create, view, and delete favorite cities. Cities are not limited to the United States.

## Endpoints

- GET `/api/v1/forecast?location=CITYNAME`
- GET `/api/v1/backgrounds?location=CITYNAME`
- POST `/api/v1/users?email=EXAMPLE@EXAMPLE.COM&password=PASSWORD&password_confirmation=PASSWORD`
- POST `/api/v1/sessions?user[email]=EXAMPLE@EXAMPLE.COM&user[password]=PASSWORD`
- POST `/api/v1/favorites?api_key=USER_API_KEY&location=CITY_ID`
- GET `/api/v1/favorites?api_key=USER_API_KEY`
- DELETE `/api/v1/favorites?api_key=USER_API_KEY&location=CITY_ID`

## Getting Started

### Requirements

Requires Ruby 2.4.1 and Rails 5.2.3

### Setup

Clone down the repo and bundle:

`$ git clone https://github.com/carriewalsh/sweater_weather.git`
`$ bundle`

Set up the database:

`$ rake db:{create,migrate}`

Set up figaro:

`$ figaro install`

### Api Keys

You will need to set up 3 API keys and add them to config/application.yml:

- DarkSky defined within `ENV[DARK_SKY_SECRET_KEY]`
- Google Geocoding defined within `ENV[GOOGLE_SECRET_KEY]`
- Flickr defined within `ENV[FLICKR_API_KEY]`

### Data

Run these after setting up the app:

- `$ rake import:cities #takes a minute - creates city and photo`
- `$ rake create:days #makes 14 days`
- `$ rake update:steadies`
- `$ rake update:city_days`
- `$ rake update:currents`

Scheduled updates - for Heroku scheduled tasks:

- `rake update:steadies #updates 6 city_steadies per city and creates 1 - nightly`
- `rake update:city_days #updates 6 city_days per city and creates 1 - nightly`
- `rake update:day #adds one day 14 days from now - nightly`
- `rake update:currents #updates current for every city or creates one for new city - 10 minutely`

Scheduled destroys - for Heroku scheduled tasks:

- `rake destroy:data - #destroys days, city_days, and city_steadies older than 21 days - nightly`

## Author

At the time of this project, I am in my final week of Mod 3 at Turing School of Software & Design.

### Future Functionality

This app is also set up to create antipodes (cities directly opposite each other on the globe).

This utilizes the AmyPode API found at: `http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82`
