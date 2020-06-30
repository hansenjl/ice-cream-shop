class User < ActiveRecord::Base
    has_secure_password
    has_many :ice_creams
end