class User < ActiveRecord::Base
    has_secure_password
    has_many :maintenances

    validates :email, presence: true
    validates :username, presence: true
    # email format is correct
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

end
