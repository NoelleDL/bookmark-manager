require 'sinatra/base'
require './lib/link.rb'
require './database_connection_setup'
require 'uri'
require 'sinatra/flash'

class Bookmarks < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/add-new-link' do
    flash[:notice] = "You must submit a valid URL." unless Link.create(url: params['url'])
    redirect '/'
  end


  run! if app_file == $0
end
