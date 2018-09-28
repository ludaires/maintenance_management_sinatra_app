class MaintenancesController < ApplicationController

# create new maintenance
    get '/maintenances/new' do
        if logged_in?             
            erb :'/maintenances/create_maintenance'
        else
            redirect :'/users/login'
        end
    end

    post '/maintenances' do        
        @maintenance = Maintenance.new(params[:maintenance])
        @equipment = Equipment.find_by(id: @maintenance.equipment.id)
        # Checking equipment maintenance status to make sure we are not creating a new maintenance without closing the old one.
        @equipment.maintenances.each do |m|
            @eq_in_maintenance = m.status
            @eq_maintenance_id = m.id
        end
        # checking if we have a open maintenance
        if  @eq_in_maintenance == "in_progress"
            flash[:message] = "You need to close this maintenance to create a new one."
            redirect :"/maintenances/#{@eq_maintenance_id}"
        # checking in case we don't have a open maintenance.
        elsif @eq_in_maintenance != "in_progress"
            @maintenance.save
            if @maintenance.save
                @inspection = Inspection.create(params[:inspection])
                @inspection.update(maintenance_id: @maintenance.id)
                redirect :"/maintenances/#{@maintenance.id}"
            # ckecking in case a user don't fill it up all the requirements to open a maintenance. 
            else
                flash[:message] = "Something went wrong: #{@maintenance.errors.full_messages.to_sentence}"
                redirect :'/maintenances/new'
            end
        end
    end

    get '/maintenances' do
        erb :'/maintenances/index_maintenances'
    end
    
# add maintenance details using inspection and inspection_parts models.
    get '/maintenances/:id' do
        @maintenance = Maintenance.find(params[:id])
        @inspection = Inspection.find(@maintenance.id)
        if logged_in? && @maintenance.user.id == current_user.id
            @issues = Code.where(code_type: "Problemas")
            @causes = Code.where(code_type: "Causas")
            @actions = Code.where(code_type: "Ações")
            erb :'/maintenances/show_maintenance'
        else
            flash[:message] = "Your user doesn't have the permission to edit this maintenance."
            redirect :'/users/login'
        end
    end

    post '/maintenances/:id/inspections' do
        @inspection = Inspection.find(params[:inspection][:maintenance_id])
        @maintenance = Maintenance.find(params[:id])
        # if logged_in? && @maintenance.user.id == current_user.id
            @inspection_part = InspectionPart.create(inspection_id: @inspection.id, part_id: params[:inspection_parts][:part_id])
            codes = "#{params[:inspection_parts][:"code_id_1"]}, #{params[:inspection_parts][:"code_id_2"]}, #{params[:inspection_parts][:"code_id_3"]}"
            @inspection_part.update(codes: codes)
            redirect :"/inspection_parts/#{@inspection_part.id}"
        # else
            # flash[:message] = "Your user doesn't have the permission to edit this maintenance."
            # redirect :'/users/login'
        # end
    end

    # edit maintenance - close status
    get '/maintenances/:id/edit' do
        @maintenance = Maintenance.find(params[:id])
        if logged_in? && @maintenance.user.id == current_user.id
            erb :"/maintenances/edit_maintenance"
        else
            flash[:message] = "Your user doesn't have the permission to edit this maintenance."
            redirect :'/users/login'
        end
    end

    patch '/maintenances/:id' do
        @maintenance = Maintenance.find(params[:id])
        @maintenance.update(status: params[:status])
        redirect :"/maintenances/#{@maintenance.id}"
    end

    delete '/maintenances/:id/delete' do
        @maintenance = Maintenance.find(params[:id])
       if logged_in? && @maintenance.user.id == current_user.id
            @maintenance = Maintenance.find(params[:id])
            @maintenance.destroy
            flash[:message] = "Delete successful!"
            redirect :"/users/#{@maintenance.user.id}"
       else
            flash[:message] = "Error. The user id does not match. Only the creator of the entry can delete this."
            redirect :"/maintenances/#{@maintenance.id}"
       end
    end

end
