class MaintenancesController < ApplicationController


    get '/maintenances/new' do
        if logged_in?             
            erb :'/maintenances/create_maintenance'
        else
            redirect :'/users/login'
        end
    end

    post '/maintenances' do        
        @maintenance = Maintenance.create(params)
        redirect :"/maintenances/#{@maintenance.id}"
    end

    get '/maintenances/:id' do
        @maintenance = Maintenance.find(params[:id])
        erb :'/maintenances/show_maintenance'
    end




end
