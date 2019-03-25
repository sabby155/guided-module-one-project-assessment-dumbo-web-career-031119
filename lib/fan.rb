class Fan < ActiveRecord::Base 
    belongs_to :artist
    belongs_to :user
    # has_many :albums, through: :artists    

    
end 