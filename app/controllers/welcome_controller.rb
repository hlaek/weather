class WelcomeController < ApplicationController
  def test
  	response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=28204&units=imperial&appid=0c0abeea3bf8e2f940a4487398d2cef3")


  	@location = response['name']
  	@country = response['sys']['country']
  	@temperature = response['main']['temp']
  	@weather_icon = response['weather'][0]['icon']
  	@weather_description = response['weather'][0]['description']
  	@cloudiness = response['clouds']['all']
  	@windiness = response['wind']['speed']

  end


  def index
  	if params[:zipcode] != '' && !params[:zipcode].nil?
  	response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{params[:zipcode]}&units=imperial&appid=0c0abeea3bf8e2f940a4487398d2cef3")


  	@location = response['name']
  	@country = response['sys']['country']
  	@temperature = response['main']['temp']
  	@weather_icon = response['weather'][0]['icon']
  	@weather_description = response['weather'][0]['description']
  	@cloudiness = response['clouds']['all']
  	@windiness = response['wind']['speed']
  end
  end
end
