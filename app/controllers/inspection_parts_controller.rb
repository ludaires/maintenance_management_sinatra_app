class InspectionPartsController < ApplicationController

    get '/inspection_parts/:id' do
        @inspection_part = InspectionPart.find(params[:id])
        erb :'/inspection_parts/show_inspection_part'
    end

end