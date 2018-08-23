class CodesController < ApplicationController

    # create action
    get '/codes/new' do
        erb :'/codes/create_code'
    end

    post '/new' do
        if params[:code].present? && params[:code_type].present? && params[:title].present?
            @c = Code.create(params)
            erb :'/codes/show'
        else
            flash[:message] = "You need to complete all fields "
            redirect :'codes/new'
        end
        
    end

    # edit action
    get '/codes/:id/edit' do
        @c = Code.find_by(:id => params[:id])
        erb :'/codes/edit_code'
    end

    patch '/codes/:id' do
        @c = Code.find_by(id: params[:id])
        if params[:code].present? && params[:code_type].present? && params[:title].present?
            binding.pry
            @c.update(code: params[:code], code_type: params[:code_type], title: params[:title])
            erb :'/codes/show'
        else
            redirect :"/codes/#{@c.id}/edit" 
        end
      
    end


    # delete action
    get '/code/:id/delete' do
        erb :'/codes/delete_code'
    end
    
    delete '/codes/:id/delete' do
        @c = Code.find(params[:id])
        @c.delete
    end



end