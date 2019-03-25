class Album < ActiveRecord::Base 
    belongs_to :artist
    # has_many :fans, through: :artists <-- do i need this?

    
end   