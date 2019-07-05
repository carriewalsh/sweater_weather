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
request:
```javascript
Content-Type: application/json
Accept: application/json
```
response:
```javascript
{
    "city": {
        "id": 6,
        "name": "Otis",
        "state": "OR 97368",
        "country": "USA",
        "latitude": "45.0242748",
        "longitude": "-123.9465021",
        "createdAt": "2019-07-01T03:25:25.050Z",
        "updatedAt": "2019-07-01T03:25:25.050Z"
    },
    "current": {
        "temp": 58.38,
        "apparent": 58.38,
        "icon": "cloudy",
        "cloud_cover": 0.99,
        "humidity": 0.9,
        "visibility": 9.225,
        "uv_index": 0,
        "wind_speed": 2.35,
        "wind_direction": 355,
        "summary": "Overcast"
    },
    "steadies": {
        "sunrise": "5:32AM",
        "sunset": "9:05PM",
        "moonPhase": -0.043,
        "phaseDescription": "Waning crescent",
        "phaseIcon": "cw_waning_crescent"
    },
    "forecast": {
        "1": {
            "high": 66.69,
            "low": 55.94,
            "icon": "partly-cloudy-day",
            "precipProbability": 0.15,
            "summary": "Mostly cloudy throughout the day."
        },
        "2": {
            "high": 68.09,
            "low": 55.28,
            "icon": "partly-cloudy-day",
            "precipProbability": 0.15,
            "summary": "Mostly cloudy throughout the day."
        },
        "3": {
            "high": 68.86,
            "low": 53.6,
            "icon": "partly-cloudy-day",
            "precipProbability": 0.12,
            "summary": "Mostly cloudy throughout the day."
        },
        "4": {
            "high": 69.93,
            "low": 54.67,
            "icon": "partly-cloudy-day",
            "precipProbability": 0.02,
            "summary": "Mostly cloudy throughout the day."
        },
        "5": {
            "high": 69.22,
            "low": 54.55,
            "icon": "cloudy",
            "precipProbability": 0.03,
            "summary": "Overcast throughout the day."
        },
        "6": {
            "high": 70.28,
            "low": 53.85,
            "icon": "cloudy",
            "precipProbability": 0.03,
            "summary": "Overcast throughout the day."
        },
        "7": {
            "high": 71.85,
            "low": 55.36,
            "icon": "rain",
            "precipProbability": 0.39,
            "summary": "Possible light rain in the morning."
        },
        "8": {
            "high": 73.2,
            "low": 56.6,
            "icon": "partly-cloudy-day",
            "precipProbability": 0,
            "summary": "Mostly cloudy throughout the day."
        }
    }
}
```
- GET `/api/v1/backgrounds?location=CITYNAME`
request:
```javascript
Content-Type: application/json
Accept: application/json
```
response:
```javascript
{
    "data": {
        "id": "26",
        "type": "photo",
        "attributes": {
            "id": 26,
            "photo_id": "8576878570",
            "secret": "28bb44c266",
            "server": "8509",
            "title": "[Explored] Alone With The Blossoms",
            "url": "https://farm9.staticflickr.com/8509/8576878570_28bb44c266.jpg"
        },
        "relationships": {
            "city": {
                "data": {
                    "id": "26",
                    "type": "city"
                }
            }
        }
    }
}
```
- POST `/api/v1/users?email=EXAMPLE@EXAMPLE.COM&password=PASSWORD&password_confirmation=PASSWORD`
request:
```javascript
Content-Type: application/json
Accept: application/json
```
response:
```javascript
{
    "api_key": "b9a5"
}
```
- POST `/api/v1/sessions?user[email]=EXAMPLE@EXAMPLE.COM&user[password]=PASSWORD`
request:
```javascript
Content-Type: application/json
Accept: application/json
```
response:
```javascript
{
    "api_key": "b9a5"
}
```
- POST `/api/v1/favorites?location=CITY_ID`
request:
```javascript
Content-Type: application/json
Accept: application/json
{
    "api_key": "b9a5"
}
```
response:
```javascript
{
    "success": "Arlington, Texas has been favorited."
}
```
- GET `/api/v1/favorites`
request:
```javascript
Content-Type: application/json
Accept: application/json
{
    "api_key": "b9a5"
}
```
response:
```javascript
{
    "test@example.com": {
        "data": [
            {
                "Arlington": {
                    "id": 50,
                    "temp": "83.47",
                    "apparent": "87.91",
                    "icon": "partly-cloudy-day",
                    "cloud_cover": "0.79",
                    "humidity": "0.65",
                    "visibility": "10.0",
                    "uv_index": "5.0",
                    "wind_speed": "6.18",
                    "wind_direction": "195.0",
                    "created_at": "2019-06-04T15:48:44.019Z",
                    "updated_at": "2019-06-04T15:48:44.019Z",
                    "city_id": 50,
                    "summary": "Mostly Cloudy"
                }
            }
        ]
    }
}
```
- DELETE `/api/v1/favorites?api_key=USER_API_KEY&location=CITY_ID`
request:
```javascript
Content-Type: application/json
Accept: application/json
{
    "api_key": "b9a5"
}
```
response:
```javascript
{
    "success": "New York, New York has been removed from favorites"
}
```

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

## Schema

![Sweater Weather Schema](/schema.png?raw=true "Sweater Weather Schema")

## Antipode Functionality

This app is also set up to create antipodes (cities directly opposite each other on the globe).

This utilizes the AmyPode API found at: `http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82`

- api_key defined within `ENV[AMY_KEY]`
- within the header `api_key`

### Endpoint

- GET `/api/v1/antipode?loc=CITYNAME`
request:
```javascript
Content-Type: application/json
Accept: application/json
{
    "api_key": "b9a5"
}
```
response:
```javascript
{
    "data": {
        "id": "12",
        "type": "antipode",
        "attributes": {
            "id": 12,
            "search_location": "Kowloon"
        },
        "relationships": {
            "city": {
                "data": {
                    "id": "52",
                    "type": "city"
                }
            },
            "city_current": {
                "data": {
                    "id": "51",
                    "type": "city_current"
                }
            }
        }
    },
    "included": [
        {
            "id": "52",
            "type": "city",
            "attributes": {
                "id": 52,
                "name": "Jujuy",
                "state": "Jujuy",
                "latitude": "-22.3193039",
                "longitude": "-65.8306389",
                "country": "Argentina"
            },
            "relationships": {
                "city_steadies": {
                    "data": []
                },
                "city_days": {
                    "data": []
                },
                "city_current": {
                    "data": {
                        "id": "52",
                        "type": "city_current"
                    }
                },
                "photo": {
                    "data": {
                        "id": "52",
                        "type": "photo"
                    }
                }
            }
        },
        {
            "id": "51",
            "type": "city_current",
            "attributes": {
                "id": 51,
                "city_id": 52,
                "temp": "59.84",
                "apparent": "59.84",
                "icon": "partly-cloudy-day",
                "cloud_cover": "0.81",
                "humidity": "0.08",
                "visibility": "10.0",
                "uv_index": "2.0",
                "wind_speed": "3.21",
                "wind_direction": "75.0",
                "summary": "Mostly Cloudy"
            }
        }
    ]
}
```

## Author

At the time of this project, I am in my final week of Mod 3 at Turing School of Software & Design.
