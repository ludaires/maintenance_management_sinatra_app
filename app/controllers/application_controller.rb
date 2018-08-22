require './config/environment'
require 'sinatra'
require 'sinatra/flash'


class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "maintenance_management"
        register Sinatra::Flash
    end

    get '/' do
        erb :'index'
    end

    helpers do
        def logged_in? 
            !!session[:user_id]
        end

        def current_user
            User.find(session[:user_id])
        end

        def set_session
            session[:user_id] = @user.id
        end

        
end 