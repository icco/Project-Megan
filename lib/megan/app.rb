
module Megan 

   # The sinatra app. This defines all of the the routes and views and stuff.
   # This is the first responder as well.
   class App < Sinatra::Base
      require "sinatra/reloader" if development?

      set :root,     File.dirname(__FILE__) + "/../.."
      set :app_file, __FILE__
      set :static, true
      set :public, Proc.new { File.join(root, "static") }
      enable :sessions

      include Megan

      get '/' do
         erb :index, :locals => { :recent => Douche.getRecent }
      end

      post '/' do
         d =  Douche.new
         d.name = params['name']
         d.location = params['location']
         d.short = params['short']
         d.date = Time.new
         d.password = Douche.randPW
         Megan.log d.inspect
         d.save

         d.to_json
      end

      get '/view/:id/?' do
         p = Douche.build params[:id]
         if p
            erb :view, :locals => { :douche => p }
         else
            status 404
            "Not found"
         end
      end

      get '/css/style.css' do
         content_type 'text/css', :charset => 'utf-8'
         #response['Expires'] = (Time.now + 60*60*24*356*3).httpdate
         less :style
      end
   end
end
