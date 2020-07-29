class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar  

    validates :name, 
        presence: true,
        length: {maximum:18},
        uniqueness: true,
        format: { with: /\A[-_a-z0-9]+\z/i }
    
    validates :displayname,
        length: {maximum:50}
    
    validates :profile,
        length: {maximum:150}
end