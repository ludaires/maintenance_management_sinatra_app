class Maintenance < ActiveRecord::Base
    belongs_to :equipment
    belongs_to :user
    has_many :inspections

    validates :next_maintenance_date, presence: true

end
