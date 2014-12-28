# -*- coding: utf-8 -*-
require 'sinatra'
require 'data_mapper'


DataMapper.setup( :default, ENV['DATABASE_URL'] ||
"sqlite3://#{Dir.pwd}/lugares.db" ) if development?
DataMapper.setup( :default, ENV['DATABASE_URL'] ) if production?
DataMapper::Logger.new($stdout, :debug)
DataMapper::Model.raise_on_save_failure = true

require_relative 'model'

DataMapper.finalize

#DataMapper.auto_migrate!
DataMapper.auto_upgrade!

Base = 36


get '/' do
  erb :index
end

get '/recomendados' do
  erb :recomendados
end

get '/buscar-sitio' do
  erb :bsitio
end

post '/buscar-sitio' do
  lugar = params[:lugares].upcase
  @listado = Lugares.buscarsitio(lugar)

  erb :bsitio
end

get '/buscar-enfermedad' do
  erb :benfermedad
end

post '/buscar-enfermedad' do
  lugar = params[:enfermedades].upcase
  @listado = Enfermedad.buscarsitio(lugar)

  erb :benfermedad
end

get '/buscar-beneficio' do
  erb :bbeneficio
end

post '/buscar-beneficio' do
  lugar = params[:beneficios].upcase
  @listado = Beneficio.buscarsitio(lugar)

  erb :bbeneficio
end

get '/datos-de-prueba' do
  Lugares.first_or_create(:nombre => "Tenerife", :provincia => "S/C de Tenerife", :pais => "España")
  Lugares.first_or_create(:nombre => "La Palma", :provincia => "S/C de Tenerife", :pais => "España")
  Lugares.first_or_create(:nombre => "La Gomera", :provincia => "S/C de Tenerife", :pais => "España")
  Lugares.first_or_create(:nombre => "El Hierro", :provincia => "S/C de Tenerife", :pais => "España")
  Lugares.first_or_create(:nombre => "Gran Canaria", :provincia => "Las Palmas de Gran Canaria", :pais => "España")
  Lugares.first_or_create(:nombre => "Lanzarote", :provincia => "Las Palmas de Gran Canaria", :pais => "España")
  Lugares.first_or_create(:nombre => "Fuerteventura", :provincia => "Las Palmas de Gran Canaria", :pais => "España")

  redirect '/'
end
