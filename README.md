# README

importing files
rake import:cities #takes a minute - creates city and photo
rake create:days #makes 14 days

scheduled updates
rake update:steadies #updates 6 steadies per city and creates 1 - nightly
rake update:city_days #updates 6 citydays per city and creates 1 - nightly
rake update:day #adds one day 14 days from now - nightly

rake update:currents #updates current for every city or creates one for new city - 10 minutely

scheduled destroys
rake destroy:data - #destroys days,citydays,citysteadies older than 21 days - nigthly
