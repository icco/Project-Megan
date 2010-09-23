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


module Megan
   # Exists so we can do some base config on startup
   def self.new
      dbs = {
         :production => {
            :db => "project-megan-production",
            :port => 27025
         },
         :development => {
            :db => "project-megan-development",
            :port => 27024
         }
      }

      MongoMapper.connection = Mongo::Connection.new('flame.mongohq.com', dbs[Megan::App.environment][:port])
      MongoMapper.database = dbs[Megan::App.environment][:db]
      MongoMapper.database.authenticate(ENV['MONGOHQ_USER'], ENV['MONGOHQ_PASSWORD'])
      self.log "Running on MongoHQ: #{dbs[Megan::App.environment].inspect}"
   end

   # This logging stuff was stolen from kneath's WatchTower
   def self.log(message, &block)
      logger.info(message, &block)
   end

   def self.logger
      @logger ||= Logger.new('error.log', "daily").tap do |logger|
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
