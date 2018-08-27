class MaintenancesController < ApplicationController


    get '/maintenances/new' do
        if logged_in?             
            erb :'/maintenances/create_maintenance'
        else
            redirect :'/users/login'
        end
    end

    post '/maintenances' do        
        @maintenance = Maintenance.create(params[:maintenance])
        @inspection = Inspection.create(params[:inspection])
        @inspection.update(maintenance_id: @maintenance.id)
        redirect :"/maintenances/#{@maintenance.id}"
    end

    get '/maintenances/:id' do
        @maintenance = Maintenance.find(params[:id])
        @inspection = Inspection.find(@maintenance.id)
        @issues = Code.where(code_type: "Problemas")
        @causes = Code.where(code_type: "Causas")
        @actions = Code.where(code_type: "Ações")
        erb :'/maintenances/show_maintenance'
    end

    post '/maintenances/:id/inspections' do
        @inspection = Inspection.find(params[:inspection][:maintenance_id])
        @inspection_part = InspectionPart.create(inspection_id: @inspection.id,part_id: params[:inspection_parts][:part_id])
        codes = "#{params[:inspection_parts][:"code_id_1"]}, #{params[:inspection_parts][:"code_id_2"]}, #{params[:inspection_parts][:"code_id_3"]}"
        @inspection_part.update(codes: codes)
        redirect :"/inspection_parts/#{@inspection_part.id}"
    end

    get '/maintenances/:id/edit' do
        # raise params.inspect
        @maintenance = Maintenance.find(params[:id])
        erb :"/maintenances/edit_maintenance"
    end

    patch '/maintenances/:id' do
        @maintenance = Maintenance.find(params[:id])
        @maintenance.update(status: params[:status])
        redirect :"/maintenances/#{@maintenance.id}"
    end


end
