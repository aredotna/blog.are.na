require 'sinatra'
require 'datamapper'
require 'rack-flash'

# enable :sessions
# use Rack::Flash

helpers do
  # TODO: Put helpers here.
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/my.db")

# TODO: Add database models here.

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  haml :index
end

get '/*' do
  haml :not_found
end
