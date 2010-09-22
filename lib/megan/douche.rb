# The actual document storred in the DB
module Megan 
   class Douche
      include MongoMapper::Document
      key :name, String, :required => true
      key :location, String, :required => true
      key :sex, String
      key :date, Time
      key :password, String, :required => true
      key :short, String, :required => true
      key :long, String

      def Douche.getRecent
         return Array.new
      end

      def Douche.randPW
         size = 8
         chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
         return (1..size).collect{|a| chars[rand(chars.size)] }.join
      end
   end
end
