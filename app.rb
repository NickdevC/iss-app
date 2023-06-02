# frozen_string_literal: true

# myapp.rb
require 'sinatra'
require_relative 'open_notify'
require 'json'

# Allow our templates in views/ to end in `.html.erb`
Tilt.register Tilt::ERBTemplate, 'html.erb'

set :layout, 'views/layout.html.erb'

get '/' do
  erb :index
end

get '/position' do
  iss_now = OpenNotify.iss_now

  erb :position, locals: { data: iss_now }
end

get '/astronauts' do
  astros = OpenNotify.astros
  
  erb :astronauts, locals: { data: astros }
end

get '/iss_position' do
  content_type :json
  {"iss_position": {"longitude": "-3.4941", "latitude": "-37.5113"}, "timestamp": 1684502291, "message": "success"}.to_json
end