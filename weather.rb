require "forecast_io"

# configure the Dark Sky API with your API key
ForecastIO.api_key = "30e771bb0f7be4c70e1feacd0eee6882"

# do the heavy lifting, use Global Hub lat/long
forecast = ForecastIO.forecast(42.0574063,-87.6722787).to_hash

# pp = pretty print
# use instead of `puts` to make reading a hash a lot easier
# e.g. `pp forecast`
# pp forecast
# Example output:
#
# In Chicago, it is currently 33.89 degress and Clear
# Extended forecast:
# A high temperature of 36.47 and Possible flurries in the afternoon.
# A high temperature of 33.98 and Mostly cloudy throughout the day.
# A high temperature of 33.94 and Possible light snow until evening.
# A high temperature of 32.73 and Mostly cloudy throughout the day.
# A high temperature of 32.51 and Partly cloudy throughout the day.
# A high temperature of 40.42 and Clear throughout the day.
# A high temperature of 23.21 and Overcast throughout the day.
# A high temperature of 29.12 and Clear throughout the day.

puts "In #{forecast["timezone"]}"
current_temperature = forecast ["currently"]["temperature"]
conditions = forecast ["currently"]["summary"]
puts "In Evanston, it is currently #{current_temperature} and #{conditions}"
# high_temperature = forecast ["daily"] ["data"][0]["temperatureHigh"]
#puts high_temperature
#puts forecast ["daily"] ["data"][1]["temperatureHigh"]
#puts forecast ["daily"] ["data"][2]["temperatureHigh"]
#puts forecast ["daily"] ["data"][3]["temperatureHigh"]

for day in forecast ["daily"] ["data"]
puts "A high temperature of #{day["temperaturehigh"]} and #{day ["summary"]}."

end