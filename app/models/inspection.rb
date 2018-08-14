class Inspection < ActiveRecord::Base
    belongs_to :maintenance
    has_many :inspection_parts
end
