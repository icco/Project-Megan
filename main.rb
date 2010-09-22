#!/usr/bin/env ruby

# This is a fun little project inspired by @Madrox and xkcd.com

require 'rubygems'
require 'sinatra'
require 'less'
require 'rdiscount'
require 'github/markup'
require 'mongo'

include Mongo

set :public, File.dirname(__FILE__) + '/static'

configure do
   set :sessions, true
   DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://thestack.db')
end

get '/' do
   erb :index, :locals => { :recent => Douche.getRecent }
end

get '/view/:id' do
   p = Douche.build params[:id]
   if p
      erb :view, :locals => { :post => p }
   else 
      status 404 "Not found"
   end
end

get '/style.css' do
   content_type 'text/css', :charset => 'utf-8'
   #response['Expires'] = (Time.now + 60*60*24*356*3).httpdate
   less :style
end

class Douche
   def initialize
      if ENV['MONGOHQ_HOST']
         puts "Running on MongoHQ" 
         MongoMapper.connection = Mongo::Connection.new(ENV['MONGOHQ_HOST'], ENV['MONGOHQ_PORT'])
         MongoMapper.database = ENV['MONGOHQ_DATABASE']
         MongoMapper.database.authenticate(ENV['MONGOHQ_USER'],ENV['MONGOHQ_PASSWORD'])
      else
         puts "Using local database" 
         MongoMapper.database = 'tout-pour-mon-ipad'
      end


   end

   def getRecent

db = Connection.new.db('sample-db')
douches = db.collection('douches')

coll.remove
3.times do |i|
   coll.insert({'a' => i+1})
end
puts "There are #{coll.count()} records. Here they are:"
coll.find().each { |doc| puts doc.inspect }


   end
end

