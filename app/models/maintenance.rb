class Maintenance < ActiveRecord::Base
    belongs_to :equipment
    belongs_to :user
    has_many :inspections
end
