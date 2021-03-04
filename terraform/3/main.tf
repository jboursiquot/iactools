provider "http" {
}

data "http" "weather" {
  url = "https://www.metaweather.com/api/location/search/?lattlong=39.267471,-76.798019"

  request_headers = {
    "Accept" = "application/json"
  }
}

output "body" {
    value = jsondecode(data.http.weather.body)[0]
}

output "headers" {
    value = data.http.weather.response_headers
}