class InspectionPart < ActiveRecord::Base
    belongs_to :inspection
    belongs_to :part
end
