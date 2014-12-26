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
  @listado = Producto.buscarsitio(lugar)

  erb :bsitio
end

get '/buscar-enfermedad' do
  erb :benfermedad
end

post '/buscar-enfermedad' do

end

get '/buscar-beneficio' do
  erb :bbeneficio
end

post '/buscar-beneficio' do

end
