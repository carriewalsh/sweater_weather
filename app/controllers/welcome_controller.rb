class WelcomeController < ApplicationController
  def index
    render json: {
      application_name: "Sweater Weather",
      author: "Carrie Walsh",
      github_site: "https://github.com/carriewalsh/sweater_weather",
      summary: {
        text: "This solo project is an API that provides the json-ified weather data for a weather app (yet to be made). The fifty most populous cities are imported into the database and every time a new city is searched, that becomes a new data point. The weather data is separated into 3 tables:",
        tables: {
          city_steadies: "sunrise/sunset/moon_phase - as these do not change",
          city_days: "the forecasts for the next several days - only updated daily",
          city_currents: "current forecast data for city - updated frequently"
        }
      },
      endpoints: {
        "GET /api/v1/forecast?location=CITYNAME": {
          request: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          response: {
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
        },
        "POST /api/v1/users?email=EXAMPLE@EXAMPLE.COM&password=PASSWORD&password_confirmation=PASSWORD": {
            request: {
              "Content-Type": "application/json",
              "Accept": "application/json"
            },
            response: {
              "api_key": "b9a5"
              }},
        "POST /api/v1/sessions?user[email]=EXAMPLE@EXAMPLE.COM&user[password]=PASSWORD": {
            request: {
              "Content-Type": "application/json",
              "Accept": "application/json"
            },
            response: {
              "api_key": "b9a5"
              }},
        "POST /api/v1/favorites?location=CITY_ID": {
          request: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "api_key": "b9a5"
          },
          response: {
            "success": "Arlington, Texas has been favorited."
            }},
        "": {
          request: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "api_key": "b9a5"
          },
          response: {
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
          }},
        "DELETE /api/v1/favorites?api_key=USER_API_KEY&location=CITY_ID": {
          request: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "api_key": "b9a5"
          },
          response: {
              "success": "New York, New York has been removed from favorites"
          }},
        "GET /api/v1/antipode?loc=CITYNAME": {
          request: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "api_key": "b9a5"
          },
          response: {
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
          }}
        },
        "cute_puppy": "http://qemistry.us/wp-content/uploads/2017/04/english-bulldog-puppies-for-josefina-female-backgrounds-with-puppy-pics-high-quality-mobile-phones.jpg"
    }
  end
end
