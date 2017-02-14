require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/pokemon'

get "/pokemons/new" do
  erb :"pokemons/new"
end

get "/pokemons" do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

get "/pokemons/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb(:"pokemons/edit")
end

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect("/pokemons/#{@pokemon.id}")
end

post '/pokemon' do
  params[:pokemon][:cp] = rand(800)
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemon/#{@pokemon.id}"
end

delete '/pokemons/:id' do
  @pokemon = Pokemons.find(params[:id])
  @pokemon.destroy
  redirect "/pokemons"
end
