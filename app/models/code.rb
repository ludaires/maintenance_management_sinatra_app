class Code < ActiveRecord::Base

    validates :code, presence: true
    validates :code_type, presence: true
    validates :title, presence: true


end
