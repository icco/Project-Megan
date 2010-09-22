module Megan 
  class App < Sinatra::Base
    set :root,     File.dirname(__FILE__) + "/../.."
    set :app_file, __FILE__
    set :public, self.root + '/static'
    enable :sessions

    include Megan

    get '/' do
       erb :index, :locals => { :recent => Douche.getRecent }
    end

    get '/view/:id' do
       p = Douche.build params[:id]
       if p
          erb :view, :locals => { :post => p }
       else
          status 404
          "Not found"
       end
    end

    get '/style.css' do
       content_type 'text/css', :charset => 'utf-8'
       #response['Expires'] = (Time.now + 60*60*24*356*3).httpdate
       less :style
    end
  end
end
