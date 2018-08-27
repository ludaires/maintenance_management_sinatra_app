class InspectionPartsController < ApplicationController

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
end