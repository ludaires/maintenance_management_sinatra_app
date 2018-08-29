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
            !!current_user
        end

        def current_user
            @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
        end

        def set_session
            session[:user_id] = @user.id
        end
    end


end 