# The actual document storred in the DB
module Megan 
   class Douche
      include MongoMapper::Document
      key :name, String, :required => true
      key :location, String, :required => true
      key :sex, String
      key :date, Time
      key :password, String
      key :short, String, :required => true
      key :long, String

      def Douche.getRecent
         return Array.new
      end
   end
end
