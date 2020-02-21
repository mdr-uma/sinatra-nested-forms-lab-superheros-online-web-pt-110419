require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team])
      params[:team][:superheros].each do |details|
        Superhero.new(details)
      end
      @superheros = Superhero.all
      # binding.pry
      
      erb :team
    end

end
