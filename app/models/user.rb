class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar  

    validates :name, 
        length: {maximum:18},
        uniqueness: true,
        format: { with: /\A[-_a-z0-9]+\z/i }

    validates :password,
        length: {minimum:8}, on: :create
    
    validates :display_name,
        length: {maximum:50}
    
    validates :profile,
        length: {maximum:150}

end