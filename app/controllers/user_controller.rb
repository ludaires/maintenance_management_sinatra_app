class UserController < ApplicationController


    get '/signup' do
        
        erb :'/users/signup'
    end

    post '/signup' do
        @user = User.create(params)
        if @user.save
            session[:id] = @user.id
            erb :'/users/show'
        else
            redirect to '/signup'
        end
    end


    get '/login' do
        erb :'/users/login'
    end

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            erb :'/users/show'
        else
            redirect :'/signup'
        end
    end



end