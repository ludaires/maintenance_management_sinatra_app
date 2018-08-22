class UserController < ApplicationController

    # route to sign up
    get '/signup' do
        if logged_in?
            @user = current_user
            redirect :"/users/#{@user.id}"
        end
        erb :'/users/signup'
    end

    post '/signup' do
        @user = User.create(params)
        if @user.save
            set_session
            flash[:message] = "You have successfully signed in!"
            redirect :"/users/#{@user.id}"
        else
            flash[:message] = "Something went wrong: #{@user.errors.full_messages.to_sentence}"
            redirect :'/signup'
        end
    end

    # route to log in
    get '/login' do
        if logged_in?
            @user = current_user
            redirect :"/users/#{@user.id}"
        end
        erb :'/users/login'
    end

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            set_session
            redirect :"/users/#{@user.id}"
        else
            flash[:message] = "Something went wrong"
            redirect :'/signup'
        end
    end

  # route to logout
    get '/logout' do
        session.clear
        redirect to :'/'
    end


    # detele user
    # get '/users/:id/delete' do
    #     if logged_in?
    #         @user = current_user
    #         erb :'/users/delete'
    #     else
    #         redirect :'/login'
    #     end
    # end

    # delete '/users/:id/delete' do
    #     if logged_in?
    #         @user1 = User.find_by_id(params[:id])
    #         if current_user.id == @user1.id
    #             @user1.delete
    #         end
    #         # flash[:message] = "Your account was deleted"
    #         redirect :'/signup'
    #     else
    #         redirect :'/login'
    #     end
    # end

    # home page user
    get '/users/:id' do
        binding.pry
        @user = current_user
        if logged_in?
            erb :'/users/show'
        else
            redirect :'/login'
        end
    end

end