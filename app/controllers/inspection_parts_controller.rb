class InspectionPartsController < ApplicationController

 # reading inspection_parts
    get '/inspection_parts/:id' do
        @inspection_part = InspectionPart.find(params[:id])
        @user = @inspection_part.inspection.maintenance.user
        if logged_in? && @user.id == current_user.id
            erb :'/inspection_parts/show_inspection_part'
        else
            flash[:message] = "Your user doesn't have the permission to edit this inspection part."
            redirect :'/users/login'
        end
    end

# Updating inspection parts

    get '/inspection_parts/:id/edit' do
        @inspection_part = InspectionPart.find(params[:id])
        @issues = Code.where(code_type: "Problemas")
        @causes = Code.where(code_type: "Causas")
        @actions = Code.where(code_type: "Ações")
        erb :'/inspection_parts/edit_inspection_part'
    end

    patch '/inspection_parts/:id' do
        @inspection_part = InspectionPart.find(params[:id])
        @inspection = Inspection.find(@inspection_part.inspection.id)
        @inspection_part.update(part_id: params[:inspection_parts][:part_id])
        codes = "#{params[:inspection_parts][:"code_id_1"]}, #{params[:inspection_parts][:"code_id_2"]}, #{params[:inspection_parts][:"code_id_3"]}"
        @inspection_part.update(codes: codes)
        redirect :"/inspection_parts/#{@inspection_part.id}"
    end


end