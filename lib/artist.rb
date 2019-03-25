class Artist < ActiveRecord::Base 
    has_one :album
    has_many :fans
    has_many :users, through: :fans
end     