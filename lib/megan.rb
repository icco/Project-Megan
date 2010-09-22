$:.unshift File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra/base'
require 'logger'

require 'mongo'
require 'mongo_mapper'
require 'digest/sha1'
require 'less'
require 'rdiscount'
require 'github/markup'

require 'megan/app'
require 'megan/douche'

puts "Running on MongoHQ" 
MongoMapper.connection = Mongo::Connection.new('flame.mongohq.com', 27066)
MongoMapper.database = 'project-megan'
MongoMapper.database.authenticate(ENV['MONGOHQ_USER'],ENV['MONGOHQ_PASSWORD'])

module Megan
   # Exists so we can do some base config on startup
   def self.new
   end

   # This logging stuff was stolen from kneath's WatchTower 
   def self.log(message, &block)
      logger.info(message, &block)
   end

   def self.logger
      @logger ||= Logger.new(config[:log], "daily").tap do |logger|
         logger.formatter = LogFormatter.new
      end
   end
   private_class_method :logger

   class LogFormatter < Logger::Formatter
      def call(severity, time, progname, msg)
         time.strftime("[%H:%M:%S] ") + msg2str(msg) + "\n"
      end
   end
end
